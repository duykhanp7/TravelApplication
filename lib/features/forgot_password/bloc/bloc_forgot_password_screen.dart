import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/forgot_password/bloc/bloc_forgot_password_event.dart';
import 'package:travel_booking_tour/features/forgot_password/bloc/bloc_forgot_password_state.dart';

import '../../../router/path.dart';
import '../../../router/routes.dart';

class BlocForgotPasswordScreen
    extends Bloc<BlocForgotPasswordEvent, BlocForgotPasswordState> {
  BlocForgotPasswordScreen() : super(BlocForgotPasswordStateInitial()) {
    on<BlocForgotPasswordEventSendEmailClick>((event, emit) {
      if (event.forgotPasswordGlobalKey.currentState?.validate() ?? false) {
        Routes.navigateTo(AppPath.checkEmail, {});
      } else {}
    });
    on<BlocForgotPasswordEventSignInClick>((event, emit) {
      Routes.navigateTo(AppPath.signInScreen, {});
    });
  }
}
