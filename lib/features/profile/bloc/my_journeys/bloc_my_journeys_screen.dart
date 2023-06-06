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

import '../../../../common/app_constant.dart';
import '../../../../data/local/app_storage.dart';
import '../../../../router/path.dart';
import '../../../../router/routes.dart';
import '../../model/user_info.dart';

class BlocMyJourneysScreen
    extends Bloc<BlocMyJourneysEvent, BlocMyJourneysState> {
  BlocMyJourneysScreen() : super(BlocMyJourneysStateInitial()) {
    on<BlocMyJourneysEvent>(mapStateToEvent, transformer: restartable());
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController journeyNameEditingController =
      TextEditingController();
  final TextEditingController locationOfJourneyEditingController =
      TextEditingController();
  final ProfileRepository _profileRepository = ProfileRepository();

  UserInfoJson? userInfoJson;
  UserInfoJson? userInfo;
  final AppStorage _appStorage = AppStorage();

  bool isPhotoLoaded = true;
  List<String>? files;

  void mapStateToEvent(
      BlocMyJourneysEvent event, Emitter<BlocMyJourneysState> emit) async {
    if (event is BlocMyJourneysEventInitial) {
      try {
        emit(BlocMyJourneysStateLoadJourneys(
            appResult: AppResult(state: ResultState.loading)));

        userInfo = UserInfoJson.fromJson(
            jsonDecode(await _appStorage.getData(AppConstant.user) ?? ''));

        final UserInfoJson? data = await loadData();

        if (data != null) {
          emit(BlocMyJourneysStateLoadJourneys(
              appResult: AppResult(state: ResultState.success, result: data)));
        }
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
            emit(BlocMyJourneysStateLoadJourneys(
                appResult: AppResult(state: ResultState.loading)));
            final UserInfoJson? data = await loadData();
            if (data != null) {
              emit(BlocMyJourneysStateLoadJourneys(
                  appResult:
                      AppResult(state: ResultState.success, result: data)));
              journeyNameEditingController.text = '';
              locationOfJourneyEditingController.text = '';
              files = null;
              Routes.backToUntilPage(AppPath.myJourneys);
            }
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
    } else if (event is BlocMyJourneysEventDeleteJourney) {
      emit(BlocMyJourneysStateDeleteJourneys(
          appResult: AppResult(state: ResultState.loading)));
      dynamic data =
          await _profileRepository.deleteJourney(event.myExperienceJson?.id);
      if (data != null) {
        await loadData();
        emit(BlocMyJourneysStateDeleteJourneys(
            appResult: AppResult(state: ResultState.success)));
      } else {
        emit(BlocMyJourneysStateDeleteJourneys(
            appResult: AppResult(state: ResultState.fail)));
      }
    }
  }

  Future<UserInfoJson?> loadData() async {
    userInfoJson =
        await _profileRepository.getUserInfo(userInfo?.id.toString());

    final List<MyExperienceJson> list = [...userInfoJson?.journeys ?? []];
    debugPrint('List Lenght  Sort : ${list.length}');
    if (list.isNotEmpty) {
      await Future.delayed(Duration.zero, () {
        list.sort((exp1, exp2) => exp2.createdAt!.compareTo(exp1.createdAt!));
        userInfoJson = userInfoJson?.copyWith(journeys: list);
      });
    }
    return userInfoJson;
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
