import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/profile/bloc/bloc_profile_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/bloc_profile_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

import '../../../base/result.dart';

class BlocProfileScreen extends Bloc<BlocProfileEvent, BlocProfileState> {
  BlocProfileScreen() : super(BlocProfileStateInitial()) {
    on<BlocProfileEvent>(mapStateToEvent, transformer: restartable());
  }

  Future<void> mapStateToEvent(
      BlocProfileEvent event, Emitter<BlocProfileState> emit) async {
    if (event is BlocProfileEventShowMoreMyPhotos) {
      Routes.navigateTo(AppPath.myPhotos, {});
    } else if (event is BlocProfileEventShowMyJourneys) {
      Routes.navigateTo(AppPath.myJourneys, {});
    } else if (event is BlocProfileEventLoadLocalImages) {
      final statusPermission = await Permission.manageExternalStorage.status;
      if (statusPermission.isGranted) {
        emit(BlocProfileStateLoadLocalImages(
            appResult: AppResult(state: ResultState.loading)));
        List<File> files = await getFiles();
        emit(BlocProfileStateLoadLocalImages(
            appResult: AppResult(state: ResultState.success, result: files)));
      } else {
        await Permission.manageExternalStorage.request();
      }
    } else if (event is BlocProfileEventAddMoreMyPhotos) {
      Routes.navigateTo(AppPath.myPhotosAddMore, {});
    } else if (event is BlocProfileEventAddMoreMyJourneys) {
      final data = await Routes.navigateTo(AppPath.myJourneysAddMore, {});
      debugPrint('BlocProfileEventAddMoreMyJourneys : $data');
    }
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
