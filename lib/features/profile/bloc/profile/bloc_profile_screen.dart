import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
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
  bool isLoading = false;
  bool isActionRefresh = false;
  Future<void> mapStateToEvent(
      BlocProfileEvent event, Emitter<BlocProfileState> emit) async {
    if (event is BlocProfileEventInitial) {
      isLoading = true;
      try {
        if (userInfoJson == null || isActionRefresh) {
          emit(BlocProfileStateLoadUserInforResult(
              appResult: AppResult(state: ResultState.loading)));
        }
        final userInfo = UserInfoJson.fromJson(
            jsonDecode(await _appStorage.getData(AppConstant.user) ?? ''));
        final UserInfoJson? temp =
            await _profileRepository.getUserInfo(userInfo.id.toString());
        if (temp != null) {
          isLoading = false;
          isActionRefresh = false;
          userInfoJson = temp;
          _appStorage.saveData(AppConstant.info, jsonEncode(userInfoJson));

          //Sort my photos
          List<PhotoJson> items = [...userInfoJson?.images ?? []];
          if (items.isNotEmpty) {
            await Future.delayed(Duration.zero, () {
              items.sort((photo1, photo2) =>
                  photo2.createdAt!.compareTo(photo1.createdAt!));
            });

            await Future.delayed(Duration.zero, () {
              final List<MyExperienceJson> list = [
                ...userInfoJson?.journeys ?? []
              ];
              list.sort((item1, item2) =>
                  item2.createdAt!.compareTo(item1.createdAt!));
              userInfoJson = userInfoJson?.copyWith(journeys: list);
            });

            userInfoJson = userInfoJson?.copyWith(images: items);
          }

          final List<MyExperienceJson> list = [...userInfoJson?.journeys ?? []];
          if (list.isNotEmpty) {
            await Future.delayed(Duration.zero, () {
              list.sort(
                  (exp1, exp2) => exp2.createdAt!.compareTo(exp1.createdAt!));
              userInfoJson = userInfoJson?.copyWith(journeys: list);
            });
          }

          emit(BlocProfileStateLoadUserInforResult(
              appResult:
                  AppResult(state: ResultState.success, result: userInfoJson)));
        }
      } on NetworkException {
        isLoading = false;
        isActionRefresh = false;
        emit(BlocProfileStateLoadUserInforResult(
            appResult: AppResult(state: ResultState.fail)));
      }
    } else if (event is BlocProfileEventShowMoreMyPhotos) {
      Routes.navigateTo(AppPath.myPhotos, {AppConstant.data: userInfoJson});
    } else if (event is BlocProfileEventShowMyJourneys) {
      Routes.navigateTo(AppPath.myJourneys, {});
    } else if (event is BlocProfileEventUpdateAvatar) {
      try {
        emit(BlocProfileStateUpdateAvatar(
            appResult: AppResult(state: ResultState.loading)));
        Map<dynamic, dynamic>? url = await _profileRepository.updateAvatar(
            File(event.avatar.path), userInfoJson?.type, userInfoJson?.id ?? 0);
        if (url != null) {
          final String? data = url['url'];
          if (data != null) {
            userInfoJson = userInfoJson?.copyWith(
                avatar: userInfoJson?.avatar?.copyWith(url: data));
            emit(BlocProfileStateUpdateAvatar(
                appResult:
                    AppResult(state: ResultState.success, result: data)));
          }
        }
      } on NetworkException {
        emit(BlocProfileStateUpdateAvatar(
            appResult: AppResult(state: ResultState.fail)));
      }
    } else if (event is BlocProfileEventUpdateCover) {
      try {
        emit(BlocProfileStateUpdateCover(
            appResult: AppResult(state: ResultState.loading)));
        Map<dynamic, dynamic>? url = await _profileRepository.updateCover(
            File(event.cover.path), userInfoJson?.type, userInfoJson?.id ?? 0);
        if (url != null) {
          final String? data = url['url'];
          if (data != null) {
            userInfoJson = userInfoJson?.copyWith(
                cover: userInfoJson?.cover?.copyWith(url: data));
            emit(BlocProfileStateUpdateCover(
                appResult:
                    AppResult(state: ResultState.success, result: data)));
          }
        }
      } on NetworkException {
        emit(BlocProfileStateUpdateCover(
            appResult: AppResult(state: ResultState.fail)));
      }
    }
  }
}
