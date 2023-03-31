import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/features/auth/signin/blocs/bloc_sign_in_event.dart';
import 'package:travel_booking_tour/features/auth/signin/blocs/bloc_sign_in_state.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../../data/models/user.dart';
import '../../../../data/network/network_exception.dart';
import '../../../../router/routes.dart';
import '../../repositories/auth_repository.dart';
// import '../../signup/repositories/auth_repository.dart';

class BlocSignInScreen extends Bloc<BlocSignInEvent, BlocSignInState> {
  String? email;
  String? password;
  bool isValidEmail = true;
  final AuthRepository _authRepository = AuthRepository();
  final AppStorage _appStorage = AppStorage();
  String errorText = 'This email has not been signed up, try sign up';

  BlocSignInScreen() : super(BlocSignInStateInitial()) {
    on<BlocSignInEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(
      BlocSignInEvent event, Emitter<BlocSignInState> emit) async {
    if (event is BlocSignInEventSignInClick) {
      emit(BlocSignInStateValidateLoading());
      if (event.signInGlobalKey.currentState?.validate() ?? false) {
        try {
          Map<String, dynamic> data = {
            "identifier": email,
            "password": password
          };
          Routes.navigateToAndRemoveUntil(AppPath.mainScreen, {});

          UserJson? userJson = await _authRepository.signIn(data);
          if (userJson != null) {
            String json = jsonEncode(userJson);
            debugPrint('User Json is $json}');
            _appStorage.saveData(AppConstant.user, json);
            _appStorage.saveData(AppConstant.password, password ?? '');
            emit(BlocSignInStateValidateSuccess());
          }
        } on NetworkException catch (ex) {
          debugPrint('Expcetion Sign In ${ex.toString()}');
          errorText = ex.getTextError;
          if (ex.statusCode == 0 ||
              ex.statusCode == 500 ||
              ex.statusCode == 503 ||
              ex.statusCode == 401) {
            emit(BlocSignInStateServerError());
          } else {
            isValidEmail = false;
            event.signInGlobalKey.currentState?.validate();
            emit(BlocSignInStateValidateFail());
          }
        }
      } else {
        emit(BlocSignInStateValidateFail());
      }
    } else if (event is BlocSignInEventSignUpClick) {
      Routes.navigateTo(AppPath.signUpScreen, {});
    } else if (event is BlocSignInEventForgotPassword) {
      Routes.navigateTo(AppPath.forgotPassword, {});
    } else if (event is BlocSignInEventChangeEmail) {
      isValidEmail = true;
      email = event.email;
      errorText = 'This email has not been signed up, try sign up';
    } else if (event is BlocSignInEventChangePassword) {
      password = event.password;
    }
  }

  String? validateTextFieldEmail(String? value) {
    if (!isValidEmail) {
      return errorText;
    } else if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if (!emailValid) {
        return 'Email is invalid';
      }
    }
    return null;
  }
}
