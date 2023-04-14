import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_state.dart';
import 'package:travel_booking_tour/features/profile/repository/profile_repository.dart';

import '../../../../base/result.dart';
import '../../../../common/enum/enums.dart';
import '../../../../router/path.dart';
import '../../../../router/routes.dart';

class BlocMyPhotosScreen extends Bloc<BlocMyPhotosEvent, BlocMyPhotosState> {
  BlocMyPhotosScreen() : super(BlocMyPhotosStateInitial()) {
    on<BlocMyPhotosEvent>(mapStateToEvent, transformer: restartable());
  }

  List<String> myPhotos = [''];
  final List<String> newPhotos = [];
  final ProfileRepository _profileRepository = ProfileRepository();

  void mapStateToEvent(
      BlocMyPhotosEvent event, Emitter<BlocMyPhotosState> emit) async {
    if (event is BlocMyPhotosEventInitial) {
      myPhotos = await _profileRepository.getMyPhotos();
      emit(BlocMyPhotosStateAddNewPhotos(
          appResult: AppResult(state: ResultState.success, result: myPhotos)));
    } else if (event is BlocMyPhotosEventClickButtonAddPhoto) {
      Routes.navigateTo(AppPath.myPhotosAddMore, {});
      final statusPermission = await Permission.manageExternalStorage.status;
      if (statusPermission.isGranted) {
        emit(BlocMyPhotosStateLoadLocalPhotos(
            appResult: AppResult(state: ResultState.loading)));
        List<File> files = await getFiles();
        emit(BlocMyPhotosStateLoadLocalPhotos(
            appResult: AppResult(state: ResultState.success, result: files)));
      } else {
        emit(BlocMyPhotosStateShowDialogRequestPermission(
            time: DateTime.now().millisecond));
      }
    } else if (event is BlocMyPhotosEventClickButtonTakePhoto) {
    } else if (event is BlocMyPhotosEventClickButtonSelectPhotosDone) {
      if (newPhotos.isNotEmpty) {
        myPhotos.addAll(newPhotos);
        emit(BlocMyPhotosStateAddNewPhotos(
            appResult:
                AppResult(state: ResultState.success, result: myPhotos)));
        newPhotos.clear();
      }
      Routes.backTo();
    } else if (event is BlocMyPhotosEventRequestPermission) {
      final requestState = await Permission.manageExternalStorage.request();
      if (requestState.isGranted) {
        List<File> files = await getFiles();
        emit(BlocMyPhotosStateLoadLocalPhotos(
            appResult: AppResult(state: ResultState.success, result: files)));
      }
    }
  }

  void addPhotoToMyPhotos(String filePath) {
    newPhotos.add(filePath);
  }

  void remove(String filePath) {
    newPhotos.remove(filePath);
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
