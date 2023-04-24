import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/data/model/result.dart';
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
  PasswordMode mode = PasswordMode.change;
  bool isCurrentPasswordValid = true;
  final TextEditingController currentPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKeyChangePassword = GlobalKey<FormState>();

  void setModePassword(PasswordMode pMode) {
    mode = pMode;
  }

  void mapStateToEvent(BlocChangePasswordEvent event,
      Emitter<BlocChangePasswordState> emit) async {
    if (event is BlocChangePasswordEventChangeCurrentPassword) {
      isCurrentPasswordValid = true;
      currentPassword = event.currentPassword;
    } else if (event is BlocChangePasswordEventChangeNewPassword) {
      newPassword = event.newPassword;
    } else if (event is BlocChangePasswordEventChangeRetypeNewPassword) {
      retypeNewPassword = event.retypePassword;
    } else if (event is BlocChangePasswordEventClickButtonSave) {
      try {
        emit(BlocChangePasswordStateResult(
            appResult: AppResult(state: ResultState.loading)));
        if (mode == PasswordMode.change) {
          if (formKeyChangePassword.currentState?.validate() ?? false) {
            final UserJson? userJson = await _authRepository.changePassword(
                currentPassword!, newPassword!, retypeNewPassword!);
            if (userJson != null) {
              currentPasswordController.text = '';
              _appStorage.saveData(AppConstant.user, jsonEncode(userJson));
              _appStorage.saveData(AppConstant.password, newPassword ?? '');
              emit(BlocChangePasswordStateResult(
                  appResult:
                      AppResult(state: ResultState.success, result: userJson)));
              Routes.backToUntilPage(AppPath.settings);
            } else {
              emit(BlocChangePasswordStateResult(
                  appResult: AppResult(state: ResultState.fail)));
            }
          } else {
            emit(BlocChangePasswordStateResult(
                appResult: AppResult(state: ResultState.fail)));
          }
        } else if (mode == PasswordMode.reset) {
          if (formKeyChangePassword.currentState?.validate() ?? false) {
            String? token = await _appStorage.getData(AppConstant.deeplink);
            final UserJson? userJson = await _authRepository.resetPassword(
                token ?? '', newPassword ?? '', retypeNewPassword ?? '');
            if (userJson != null) {
              await _appStorage.delete(AppConstant.deeplink);
              _appStorage.saveData(AppConstant.user, jsonEncode(userJson));
              _appStorage.saveData(AppConstant.password, newPassword ?? '');
              emit(BlocChangePasswordStateResult(
                  appResult:
                      AppResult(state: ResultState.success, result: userJson)));
              Routes.navigateToAndRemoveUntil(AppPath.mainScreen, {});
            } else {
              emit(BlocChangePasswordStateResult(
                  appResult: AppResult(state: ResultState.fail)));
            }
          } else {
            emit(BlocChangePasswordStateResult(
                appResult: AppResult(state: ResultState.fail)));
          }
        }
      } on NetworkException catch (e) {
        emit(BlocChangePasswordStateResult(
            appResult: AppResult(state: ResultState.fail)));
        if (mode == PasswordMode.reset) {
          await _appStorage.delete(AppConstant.deeplink);
          if (e.statusCode == 400) {
            emit(BlocChangePasswordStateTokenResetPasswordInvalid(
                time: DateTime.now().millisecond));
          }
        } else if (mode == PasswordMode.change) {
          if (e.statusCode == 400) {
            isCurrentPasswordValid = false;
            formKeyChangePassword.currentState?.validate();
          }
        }
      }
    }
  }

  String? validateTextFieldCurrentPasword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your current password';
    } else if (!isCurrentPasswordValid) {
      return 'Your current password is invalid';
    } else {
      final bool paswordValid = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value);
      if (!paswordValid) {
        return 'Password should have at least 8 characters\nMust have : number, upper, lower characters, special characters';
      }
    }
    return null;
  }

  String? validateTextFieldNewPasword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your new password';
    } else {
      final bool paswordValid = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value);
      if (!paswordValid) {
        return 'Password should have at least 8 characters\nMust have : number, upper, lower characters, special characters';
      }
    }
    return null;
  }

  String? validateTextFieldRePasword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your re-password';
    } else if (value != newPassword) {
      return 'The password is not the same';
    }
    return null;
  }
}
