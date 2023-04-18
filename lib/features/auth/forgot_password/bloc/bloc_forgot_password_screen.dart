import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/auth/repository/auth_repository.dart';
import 'package:travel_booking_tour/features/auth/forgot_password/bloc/bloc_forgot_password_event.dart';
import 'package:travel_booking_tour/features/auth/forgot_password/bloc/bloc_forgot_password_state.dart';

import '../../../../router/path.dart';
import '../../../../router/routes.dart';

class BlocForgotPasswordScreen
    extends Bloc<BlocForgotPasswordEvent, BlocForgotPasswordState> {
  BlocForgotPasswordScreen() : super(BlocForgotPasswordStateInitial()) {
    on<BlocForgotPasswordEvent>(mapStateToEvent, transformer: restartable());
  }
  final GlobalKey<FormState> forgotPasswordGlobalKey = GlobalKey<FormState>();
  final AuthRepository _authRepository = AuthRepository();
  String email = '';

  void mapStateToEvent(BlocForgotPasswordEvent event,
      Emitter<BlocForgotPasswordState> emit) async {
    if (event is BlocForgotPasswordEventSendEmailClick) {
      try {
        if (forgotPasswordGlobalKey.currentState?.validate() ?? false) {
          emit(BlocForgotPasswordStateResult(
              appResult: AppResult(state: ResultState.loading)));
          Map<String, dynamic>? respone =
              await _authRepository.sendEmailResetPassword(email);
          if (respone != null) {
            bool ok = respone['ok'];
            if (ok) {
              emit(BlocForgotPasswordStateResult(
                  appResult: AppResult(state: ResultState.success)));
              Routes.navigateTo(AppPath.checkEmail, {});
            }
          }
          emit(BlocForgotPasswordStateResult(
              appResult: AppResult(state: ResultState.success)));
        } else {}
      } on NetworkException catch (e) {
        emit(BlocForgotPasswordStateResult(
            appResult:
                AppResult(state: ResultState.fail, result: e.getTextError)));
      }
    } else if (event is BlocForgotPasswordEventSignInClick) {
      Routes.backTo();
    } else if (event is BlocForgotPasswordEventChangeEmail) {
      email = event.email;
    }
  }
}
