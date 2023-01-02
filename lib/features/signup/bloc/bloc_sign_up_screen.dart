import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/signup/bloc/bloc_sign_up_event.dart';
import 'package:travel_booking_tour/features/signup/bloc/bloc_sign_up_state.dart';
import 'package:travel_booking_tour/res/res.dart';

class BlocSignupScreen extends Bloc<BlocSignUpEvent, BlocSignUpState> {
  BlocSignupScreen() : super(BlocSignUpStateInitial()) {
    on<BlocSignUpEventValidate>((event, emit) {
      if (AppValidator.globalKeyFomrState.currentState?.validate() ?? false) {
        debugPrint('Validate success');
      } else {
        debugPrint('Validate fail');
      }
    });
  }
}
