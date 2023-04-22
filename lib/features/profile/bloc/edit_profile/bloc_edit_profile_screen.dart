import 'dart:convert';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/profile/bloc/edit_profile/bloc_edit_profile_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/edit_profile/bloc_edit_profile_state.dart';
import 'package:travel_booking_tour/features/profile/repository/profile_repository.dart';

import '../../../../common/app_constant.dart';
import '../../../../common/enum/enums.dart';
import '../../../../router/path.dart';
import '../../../../router/routes.dart';
import '../../model/user_info.dart';
import '../profile/bloc_profile_event.dart';
import '../profile/bloc_profile_screen.dart';

class BlocEditProfileScreen
    extends Bloc<BlocEditProfileEvent, BlocEditProfileState> {
  BlocEditProfileScreen() : super(BlocEditProfileStateInitial()) {
    on<BlocEditProfileEvent>(mapStateToEvent, transformer: restartable());
  }

  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final ProfileRepository _profileRepository = ProfileRepository();
  final AppStorage _appStorage = AppStorage();

  String? firstName;
  String? lastName;
  BuildContext? context;

  void init(UserInfoJson? userInfoJson) {
    firstNameTextEditingController.text = userInfoJson?.firstName ?? '';
    lastNameTextEditingController.text = userInfoJson?.lastName ?? '';
    firstName = userInfoJson?.firstName;
    lastName = userInfoJson?.lastName;
    //blocSettingScreen.passwordTextEditingController.text = userInfoJson?.password ?? '';
  }

  void setBuildContext(BuildContext a) {
    context = a;
  }

  void mapStateToEvent(
      BlocEditProfileEvent event, Emitter<BlocEditProfileState> emit) async {
    if (event is BlocEditProfileEventChangeFirstName) {
      firstName = event.firstName;
    } else if (event is BlocEditProfileEventChangeLastName) {
      lastName = event.lastName;
    } else if (event is BlocEditProfileEventClickButtonChangePassword) {
      Routes.navigateTo(AppPath.settingChangePassword,
          {AppConstant.data: PasswordMode.change});
    } else if (event is BlocEditProfileEventClickButtonSaveChange) {
      try {
        emit(BlocEditProfileStateResult(
            appResult: AppResult(state: ResultState.loading)));
        UserInfoJson? currentInfo = await _profileRepository.userInfo;
        if (currentInfo != null) {
          String? token = await _appStorage.getData(AppConstant.token);
          debugPrint('Tokennnn : $token');
          currentInfo =
              currentInfo.copyWith(firstName: firstName, lastName: lastName);
          UserInfoJson? newUserInfo =
              await _profileRepository.updateUserInfo(currentInfo);
          if (newUserInfo != null) {
            emit(BlocEditProfileStateResult(
                appResult: AppResult(state: ResultState.success)));
            _appStorage.saveData(AppConstant.info, jsonEncode(newUserInfo));
            if (context != null) {
              BlocProvider.of<BlocProfileScreen>(context!)
                  .add(BlocProfileEventInitial());
              Routes.backTo();
            }
          }
        }
      } on NetworkException catch (ex) {
        emit(BlocEditProfileStateResult(
            appResult: AppResult(state: ResultState.fail)));
        debugPrint(ex.getTextError);
      }
    }
  }
}
