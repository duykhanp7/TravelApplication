import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/signin/bloc/bloc_sign_in_event.dart';
import 'package:travel_booking_tour/features/signin/bloc/bloc_sign_in_state.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../router/routes.dart';

class BlocSignInScreen extends Bloc<BlocSignInEvent, BlocSignInState> {
  BlocSignInScreen() : super(BlocSignInStateInitial()) {
    on<BlocSignInEventSignInClick>((event, emit) {
      if (event.signInGlobalKey.currentState?.validate() ?? false) {
        debugPrint('Validate signin success');
      } else {
        debugPrint('Validate signin fail');
      }
    });
    on<BlocSignInEventSignUpClick>((event, emit) {
      Routes.backTo();
    });
    on<BlocSignInEventForgotPassword>((event, emit) {
      Routes.navigateTo(AppPath.forgotPassword, {});
    });
  }
}
