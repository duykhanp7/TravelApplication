import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_booking_tour/features/forgot_password/bloc/bloc_forgot_password_event.dart';
import 'package:travel_booking_tour/features/forgot_password/bloc/bloc_forgot_password_state.dart';

import '../../../router/path.dart';
import '../../../router/routes.dart';

class BlocForgotPasswordScreen
    extends Bloc<BlocForgotPasswordEvent, BlocForgotPasswordState> {
  BlocForgotPasswordScreen() : super(BlocForgotPasswordStateInitial()) {
    on<BlocForgotPasswordEvent>(mapStateToEvent, transformer: restartable());
  }
  final GlobalKey<FormState> forgotPasswordGlobalKey = GlobalKey<FormState>();

  void mapStateToEvent(
      BlocForgotPasswordEvent event, Emitter<BlocForgotPasswordState> emit) {
    if (event is BlocForgotPasswordEventSendEmailClick) {
      if (forgotPasswordGlobalKey.currentState?.validate() ?? false) {
        Routes.navigateTo(AppPath.checkEmail, {});
      } else {}
    } else if (event is BlocForgotPasswordEventSignInClick) {
      Routes.backTo();
    }
  }
}
