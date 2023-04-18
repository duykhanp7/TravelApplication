import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/model/user.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/auth/change_password/bloc/bloc_change_password_event.dart';
import 'package:travel_booking_tour/features/auth/change_password/bloc/bloc_change_password_state.dart';
import 'package:travel_booking_tour/features/auth/repository/auth_repository.dart';
import 'dart:convert';

import '../../../../router/path.dart';
import '../../../../router/routes.dart';

class BlocChangePasswordScreen
    extends Bloc<BlocChangePasswordEvent, BlocChangePasswordState> {
  BlocChangePasswordScreen() : super(BlocChangePasswordStateInitial()) {
    on<BlocChangePasswordEvent>(mapStateToEvent, transformer: restartable());
  }

  String? currentPassword;
  String? newPassword;
  String? retypeNewPassword;
  final AuthRepository _authRepository = AuthRepository();
  final AppStorage _appStorage = AppStorage();

  void mapStateToEvent(BlocChangePasswordEvent event,
      Emitter<BlocChangePasswordState> emit) async {
    if (event is BlocChangePasswordEventChangeCurrentPassword) {
      currentPassword = event.currentPassword;
    } else if (event is BlocChangePasswordEventChangeNewPassword) {
      newPassword = event.newPassword;
    } else if (event is BlocChangePasswordEventChangeRetypeNewPassword) {
      retypeNewPassword = event.retypePassword;
    } else if (event is BlocChangePasswordEventClickButtonSave) {
      try {
        emit(BlocChangePasswordStateSendEmailResult(
            appResult: AppResult(state: ResultState.loading)));
        String? token = await _appStorage.getData(AppConstant.deeplink);
        final UserJson? userJson = await _authRepository.resetPassword(
            token ?? '', newPassword ?? '', retypeNewPassword ?? '');
        if (userJson != null) {
          emit(BlocChangePasswordStateSendEmailResult(
              appResult:
                  AppResult(state: ResultState.success, result: userJson)));
          await _appStorage.delete(AppConstant.deeplink);
          _appStorage.saveData(AppConstant.user, jsonEncode(userJson));
          _appStorage.saveData(AppConstant.password, newPassword ?? '');
          Routes.navigateToAndRemoveUntil(AppPath.mainScreen, {});
        }
      } on NetworkException catch (e) {
        emit(BlocChangePasswordStateSendEmailResult(
            appResult: AppResult(state: ResultState.fail)));
        await _appStorage.delete(AppConstant.deeplink);
        if (e.statusCode == 400) {
          emit(BlocChangePasswordStateTokenResetPasswordInvalid(
              time: DateTime.now().millisecond));
        }
      }
    }
  }
}
