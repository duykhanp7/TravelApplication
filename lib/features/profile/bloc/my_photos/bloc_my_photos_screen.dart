import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_state.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/features/profile/repository/profile_repository.dart';

import '../../../../data/model/result.dart';
import '../../../../common/enum/enums.dart';
import '../../../../router/path.dart';
import '../../../../router/routes.dart';

class BlocMyPhotosScreen extends Bloc<BlocMyPhotosEvent, BlocMyPhotosState> {
  BlocMyPhotosScreen() : super(BlocMyPhotosStateInitial()) {
    on<BlocMyPhotosEvent>(mapStateToEvent, transformer: restartable());
  }

  List<PhotoJson> myPhotos = [];
  List<String> newPhotos = [];
  final List<PhotoJson> newPhotosJson = [];
  List<PhotoJson> deletePhotos = [];
  List<PhotoJson> localFilePhotos = [const PhotoJson(id: -1)];
  final ProfileRepository _profileRepository = ProfileRepository();
  MyPhotosMode myPhotosMode = MyPhotosMode.watch;
  final ScrollController scrollController = ScrollController();

  void mapStateToEvent(
      BlocMyPhotosEvent event, Emitter<BlocMyPhotosState> emit) async {
    if (event is BlocMyPhotosEventInitial) {
    } else if (event is BlocMyPhotosEventClickButtonAddPhoto) {
      Routes.navigateTo(AppPath.myPhotosAddMore, {});
      final statusPermission = await Permission.manageExternalStorage.status;
      if (statusPermission.isGranted) {
        emit(BlocMyPhotosStateLoadLocalPhotos(
            appResult: AppResult(state: ResultState.loading)));
        List<File> files = await getFiles();
        final List<PhotoJson> temp = [const PhotoJson(id: -1)];
        int i = 0;
        await Future.forEach(files,
            (element) => temp.add(PhotoJson(id: i++, url: element.path)));

        localFilePhotos = temp;

        emit(BlocMyPhotosStateLoadLocalPhotos(
            appResult: AppResult(state: ResultState.success, result: files)));
      } else {
        emit(BlocMyPhotosStateShowDialogRequestPermission(
            time: DateTime.now().millisecond));
      }
    } else if (event is BlocMyPhotosEventClickButtonTakePhoto) {
    } else if (event is BlocMyPhotosEventClickButtonSelectPhotosDone) {
      if (newPhotos.isNotEmpty) {
        newPhotos = newPhotos.toSet().toList();
        emit(BlocMyPhotosStateAddNewPhotos(
            appResult: AppResult(state: ResultState.loading)));
        try {
          await Future.forEach(newPhotos, (element) async {
            debugPrint('File Selected : $element');
            PhotoJson? photo =
                await _profileRepository.postPhoto(File(element));
            newPhotosJson.add(photo);
          });

          if (newPhotosJson.isNotEmpty) {
            await Future.delayed(Duration.zero, () {
              myPhotos.insertAll(1, newPhotosJson);
            });
            await Future.delayed(Duration.zero, () {
              localFilePhotos.setAll(
                  0,
                  localFilePhotos
                      .map((e) => e.copyWith(selected: false))
                      .toList());
            });
            emit(BlocMyPhotosStateAddNewPhotos(
                appResult:
                    AppResult(state: ResultState.success, result: myPhotos)));
          }
          newPhotosJson.clear();
          newPhotos.clear();
        } on NetworkException catch (e) {
          debugPrint(e.getTextError);
          emit(BlocMyPhotosStateAddNewPhotos(
              appResult: AppResult(state: ResultState.fail)));
        }
      }
      Routes.backTo();
    } else if (event is BlocMyPhotosEventRequestPermission) {
      final requestState = await Permission.manageExternalStorage.request();
      if (requestState.isGranted) {
        List<File> files = await getFiles();
        final List<PhotoJson> temp = [const PhotoJson()];
        int i = 0;
        await Future.forEach(files,
            (element) => temp.add(PhotoJson(id: i++, url: element.path)));

        localFilePhotos = temp;

        emit(BlocMyPhotosStateLoadLocalPhotos(
            appResult: AppResult(state: ResultState.success, result: files)));
      }
    } else if (event is BlocMyPhotosEventRequestCameraPermission) {
      emit(BlocMyPhotosStateShowDialogRequestCameraPermission(
          time: DateTime.now().millisecond));
    } else if (event is BlocMyPhotosEventChangeMode) {
      myPhotosMode = event.mode;
      deletePhotos.clear();
      await Future.delayed(Duration.zero, () {
        for (int i = 0; i < myPhotos.length; i++) {
          myPhotos[i] = myPhotos[i].copyWith(selected: false);
        }
      });

      emit(BlocMyPhotosStateChangeMode(mode: event.mode));
    } else if (event is BlocMyPhotosEventDeleteImage) {
      try {
        emit(BlocMyPhotosStateDeletePhotos(
            appResult: AppResult(state: ResultState.loading)));

        deletePhotos = deletePhotos.toSet().toList();

        await Future.forEach(deletePhotos, (element) async {
          await _profileRepository.deletePhoto(element.id.toString());
          myPhotos.removeWhere((e) => e.id == element.id);
        });
        deletePhotos.clear();
        final a = Future.delayed(Duration.zero, () {
          myPhotosMode = MyPhotosMode.watch;
          emit(BlocMyPhotosStateChangeMode(mode: MyPhotosMode.watch));
        });
        final b = Future.delayed(Duration.zero, () {
          emit(BlocMyPhotosStateDeletePhotos(
              appResult: AppResult(state: ResultState.success)));
        });
        final c = Future.delayed(Duration.zero, () {
          emit(BlocMyPhotosStateAddNewPhotos(
              appResult:
                  AppResult(state: ResultState.success, result: myPhotos)));
        });
        await Future.wait([a, b, c]);
      } on NetworkException {
        emit(BlocMyPhotosStateDeletePhotos(
            appResult: AppResult(state: ResultState.fail)));
      }
    } else if (event is BlocMyPhotosEventCheckListPhotos) {
      await Future.delayed(Duration.zero, () {
        bool isAllSelected =
            myPhotos.every((element) => element.selected ?? false);
        myPhotos.setAll(0,
            myPhotos.map((e) => e.copyWith(selected: !isAllSelected)).toList());
        !isAllSelected
            ? deletePhotos
                .addAll(myPhotos.where((element) => element.id != -1).toList())
            : deletePhotos.clear();

        deletePhotos = deletePhotos.toSet().toList();
      });
      emit(BlocMyPhotosStateCheckListPhotos(time: DateTime.now().millisecond));
    } else if (event is BlocMyPhotosEventCheckListPhotosLocal) {
      await Future.delayed(Duration.zero, () {
        bool isAllSelected = [...localFilePhotos]
            .where((element) => element.id != -1)
            .toList()
            .every((element) => element.selected ?? false);

        localFilePhotos.setAll(
            0,
            localFilePhotos
                .map((e) => e.copyWith(selected: !isAllSelected))
                .toList());

        !isAllSelected
            ? newPhotos.addAll(
                (localFilePhotos.where((element) => element.id != -1).toList())
                    .map((e) => e.url ?? ''))
            : newPhotos.clear();

        newPhotos = newPhotos.toSet().toList();
      });
      emit(BlocMyPhotosStateCheckListPhotosLocal(
          time: DateTime.now().millisecond));
    }
  }

  Future<bool> isCameraPermissionGranted() async {
    return await Permission.camera.status.isGranted;
  }

  Future<bool> requestCameraPermission() async {
    PermissionStatus cameraPermission = await Permission.camera.request();
    return cameraPermission.isGranted;
  }

  void addToDeletePhoto(PhotoJson photoJson) {
    deletePhotos.add(photoJson);
  }

  void action(bool value, PhotoJson photo) {
    if (value) {
      addToDeletePhoto(photo);
    } else {
      removeOutOfDeletePhoto(photo);
    }
    updateItem(value, photo);
  }

  void removeOutOfDeletePhoto(PhotoJson photoJson) {
    deletePhotos.removeWhere(
      (element) => element.id == photoJson.id,
    );
    debugPrint('Length After Deleted : ${deletePhotos.length}');
  }

  void changeMode(MyPhotosMode mode) {
    myPhotosMode = mode;
  }

  void addPhotoToMyPhotos(String filePath) {
    newPhotos.add(filePath);
    int index =
        localFilePhotos.indexWhere((element) => element.url == filePath);
    if (index != -1) {
      localFilePhotos[index] = localFilePhotos[index].copyWith(selected: true);
    }
  }

  void updateItem(bool value, PhotoJson photoJson) {
    int index = myPhotos.indexWhere((element) => element.id == photoJson.id);
    if (index != -1) {
      myPhotos[index] = photoJson.copyWith(selected: value);
    }
  }

  void removeOutOfNewPhotos(String filePath) {
    newPhotos.remove(filePath);
    int index =
        localFilePhotos.indexWhere((element) => element.url == filePath);
    if (index != -1) {
      localFilePhotos[index] = localFilePhotos[index].copyWith(selected: false);
    }
  }

  Future<void> removeAllPhotoSeleted() async {
    await Future.forEach(
        localFilePhotos, (element) => removeOutOfNewPhotos(element.url ?? ''));
  }

  Future<List<File>> getFiles() async {
    List<Directory> storages = (await getExternalStorageDirectories())!;
    storages = storages.map((Directory e) {
      final List<String> splitedPath = e.path.split("/");
      return Directory(splitedPath
          .sublist(0, splitedPath.indexWhere((element) => element == "Android"))
          .join("/"));
    }).toList();

    final files = Directory(storages[0].path).listSync();

    final List<File> fileImages = [];

    await Future.forEach(files, (element) async {
      List<FileSystemEntity> temps = Directory(element.path).listSync();
      await Future.forEach(temps, (element) {
        final extension = element.path.split('/').last.split('.').last;
        if (extension == 'jpg' || extension == 'png' || extension == 'jpeg') {
          fileImages.add(File(element.path));
        }
      });
    });
    return fileImages;
  }
}
