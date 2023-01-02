import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/signup/bloc/bloc_sign_up_event.dart';
import 'package:travel_booking_tour/features/signup/bloc/bloc_sign_up_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

class BlocSignupScreen extends Bloc<BlocSignUpEvent, BlocSignUpState> {
  BlocSignupScreen() : super(BlocSignUpStateInitial()) {
    on<BlocSignUpEventValidate>((event, emit) {
      if (event.signUpGlobalKey.currentState?.validate() ?? false) {
        debugPrint('Validate signup success');
      } else {
        debugPrint('Validate signup fail');
      }
    });
    on<BlocSignUpEventSignInClick>(
        (event, emit) => {Routes.navigateTo(AppPath.signInScreen, {})});
  }
}
