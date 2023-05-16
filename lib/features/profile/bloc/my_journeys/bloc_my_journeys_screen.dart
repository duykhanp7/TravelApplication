import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_booking_tour/common/app_logger.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';
import 'package:travel_booking_tour/data/model/user.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_state.dart';
import 'package:travel_booking_tour/features/profile/repository/profile_repository.dart';

import '../../../../router/path.dart';
import '../../../../router/routes.dart';

class BlocMyJourneysScreen
    extends Bloc<BlocMyJourneysEvent, BlocMyJourneysState> {
  BlocMyJourneysScreen() : super(BlocMyJourneysStateInitial()) {
    on<BlocMyJourneysEvent>(mapStateToEvent, transformer: restartable());
  }

  List<MyExperienceJson> listMyExperienceJson = [];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController journeyNameEditingController =
      TextEditingController();
  final TextEditingController locationOfJourneyEditingController =
      TextEditingController();
  final ProfileRepository _profileRepository = ProfileRepository();

  bool isPhotoLoaded = true;
  List<String>? files;

  void mapStateToEvent(
      BlocMyJourneysEvent event, Emitter<BlocMyJourneysState> emit) async {
    if (event is BlocMyJourneysEventInitial) {
      try {
        emit(BlocMyJourneysStateLoadJourneys(
            appResult: AppResult(state: ResultState.loading)));
        // listMyExperienceJson = await _profileRepository.getMyJourneys();
        await Future.delayed(const Duration(seconds: 2), () {
          emit(BlocMyJourneysStateLoadJourneys(
              appResult: AppResult(state: ResultState.success)));
        });
      } on NetworkException catch (e) {
        emit(BlocMyJourneysStateLoadJourneys(
            appResult: AppResult(state: ResultState.fail)));
        AppLogger.loggerOnNetworkException(e);
      }
    } else if (event is BlocMyJourneysEventClickButtonAddJourney) {
      Routes.navigateTo(AppPath.myJourneysAddMore, {});
    } else if (event is BlocMyJourneysEventClickButtonDone) {
      bool? validate = formKey.currentState?.validate();
      if (validate != null && validate && files != null && files!.isNotEmpty) {
        try {
          emit(BlocMyJourneysStateAddJourney(
              appResult: AppResult(state: ResultState.loading)));
          UserJson? userJson = await _profileRepository.user;
          FormData data = FormData();

          Map<String, dynamic> journeyInfo = {
            'name': journeyNameEditingController.text,
            'user': userJson?.id.toString(),
            'location': locationOfJourneyEditingController.text
          };

          data.fields.add(MapEntry('data', jsonEncode(journeyInfo)));

          await Future.forEach(
              files ?? [],
              (element) async => data.files.add(MapEntry(
                  'files.multi', await MultipartFile.fromFile(element))));

          MyExperienceJson? myExperienceJson = MyExperienceJson.fromJson(
              await _profileRepository.postMyJourney(data));

          if (myExperienceJson != null) {
            listMyExperienceJson.add(myExperienceJson);

            await Future.delayed(Duration.zero, () {
              listMyExperienceJson.sort((item1, item2) =>
                  item2.createdAt!.compareTo(item1.createdAt!));
            });

            journeyNameEditingController.text = '';
            locationOfJourneyEditingController.text = '';
            Routes.backTo();
            files = null;
            emit(BlocMyJourneysStateAddJourney(
                appResult: AppResult(
                    state: ResultState.success, result: myExperienceJson)));
          } else {
            emit(BlocMyJourneysStateAddJourney(
                appResult: AppResult(state: ResultState.fail)));
          }
        } on NetworkException catch (e) {
          emit(BlocMyJourneysStateAddJourney(
              appResult: AppResult(state: ResultState.fail)));
          AppLogger.loggerOnNetworkException(e);
        }
      } else {
        if (files == null) {
          isPhotoLoaded = false;
          files = null;
          emit(BlocMyJourneysStateUploadFileOrNot(files: files));
        }
      }
    } else if (event is BlocMyJourneysEventClickButtonUploadPhotos) {
      final photos = await ImagePicker().pickMultiImage();
      if (photos.isNotEmpty) {
        isPhotoLoaded = true;
        files = photos.map((e) => e.path).toList();
        emit(BlocMyJourneysStateUploadFileOrNot(files: files));
      }
    }
  }

  String? validateJourneyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your journey name';
    }
    return null;
  }

  String? validateLocationOfJourneyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter location of journey';
    }
    return null;
  }
}
