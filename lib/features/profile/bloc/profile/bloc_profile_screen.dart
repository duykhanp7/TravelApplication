import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';
import 'package:travel_booking_tour/features/profile/repository/profile_repository.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

import 'bloc_profile_event.dart';
import 'bloc_profile_state.dart';

class BlocProfileScreen extends Bloc<BlocProfileEvent, BlocProfileState> {
  BlocProfileScreen() : super(BlocProfileStateInitial()) {
    on<BlocProfileEvent>(mapStateToEvent, transformer: restartable());
  }

  final ProfileRepository _profileRepository = ProfileRepository();
  UserInfoJson? userInfoJson;
  final AppStorage _appStorage = AppStorage();

  Future<void> mapStateToEvent(
      BlocProfileEvent event, Emitter<BlocProfileState> emit) async {
    if (event is BlocProfileEventInitial) {
      try {
        final UserInfoJson? temp = await _profileRepository.getUserInfo();
        if (temp != null) {
          userInfoJson = temp;
          _appStorage.saveData(AppConstant.info, jsonEncode(userInfoJson));
          emit(BlocProfileStateLoadUserInforResult(
              appResult:
                  AppResult(state: ResultState.success, result: userInfoJson)));
        }
      } on NetworkException catch (e) {
        debugPrint('Exception : ${e.getTextError} ${e.statusCode}');
      }
    } else if (event is BlocProfileEventShowMoreMyPhotos) {
      Routes.navigateTo(AppPath.myPhotos, {});
    } else if (event is BlocProfileEventShowMyJourneys) {
      Routes.navigateTo(AppPath.myJourneys, {});
    }
  }
}
