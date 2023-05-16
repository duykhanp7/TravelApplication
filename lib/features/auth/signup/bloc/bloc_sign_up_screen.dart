import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/features/auth/signup/bloc/bloc_sign_up_event.dart';
import 'package:travel_booking_tour/features/auth/signup/bloc/bloc_sign_up_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

import '../../../../common/app_constant.dart';
import '../../../../common/enum/enums.dart';
import '../../../../data/model/user.dart';
import '../../../../data/network/network_exception.dart';
import '../../repository/auth_repository.dart';

class BlocSignupScreen extends Bloc<BlocSignUpEvent, BlocSignUpState> {
  UserType typeAccount = UserType.traverler;
  String? firstName;
  String? lastName;
  String? country;
  String? email;
  String? password;
  String? confirmPassword;
  bool isValidEmail = true;

  final AuthRepository _authRepository = AuthRepository();
  final GlobalKey<FormState> signUpGlobalKey = GlobalKey<FormState>();
  final AppStorage _appStorage = AppStorage();

  BlocSignupScreen() : super(BlocSignUpStateInitial()) {
    on<BlocSignUpEvent>(mapEventToState, transformer: restartable());
  }

  void mapEventToState(
      BlocSignUpEvent event, Emitter<BlocSignUpState> emit) async {
    if (event is BlocSignUpEventValidate) {
      emit(BlocSignUpStateValidate(
          appResult: AppResult(state: ResultState.loading)));
      if (signUpGlobalKey.currentState?.validate() ?? false) {
        Map<String, dynamic> data = {
          "email": email,
          "username": email,
          "password": password,
          "firstName": firstName,
          "lastName": lastName,
          "country": country,
          "type": typeAccount.name
        };
        if (typeAccount == UserType.traverler) {
          try {
            debugPrint(
                'Log Information : $email $password $firstName $lastName $country');

            final UserJson? user = await _authRepository.signUp(data);
            if (user != null) {
              emit(BlocSignUpStateValidate(
                  appResult: AppResult(state: ResultState.success)));

              Map<String, dynamic> data = {
                "identifier": email,
                "password": password
              };

              UserJson? userJson = await _authRepository.signIn(data);
              if (userJson != null) {
                String json = jsonEncode(userJson);
                _appStorage.saveData(AppConstant.user, json);
                _appStorage.saveData(AppConstant.password, password ?? '');
                Routes.navigateToAndRemoveUntil(AppPath.mainScreen, {});
              }
            }
          } on NetworkException catch (ex) {
            debugPrint('Expcetion Sign Up ${ex.toString()}');
            if (ex.statusCode == 0 ||
                ex.statusCode == 500 ||
                ex.statusCode == 503 ||
                ex.statusCode == 401) {
              emit(BlocSignUpStateValidate(
                  appResult: AppResult(state: ResultState.error)));
            } else {
              isValidEmail = false;
              signUpGlobalKey.currentState?.validate();
              emit(BlocSignUpStateValidate(
                  appResult: AppResult(state: ResultState.fail)));
            }
          }
        } else if (typeAccount == UserType.guide) {
          emit(BlocSignUpStateValidate(
              appResult: AppResult(state: ResultState.fail)));
          Routes.navigateTo(AppPath.tourGuideAddProfile, data);
        }
      } else {
        emit(BlocSignUpStateValidate(
            appResult: AppResult(state: ResultState.fail)));
      }
    } else if (event is BlocSignUpEventChangeTypeAccount) {
      typeAccount = event.typeAccount;
      emit(BlocSignUpStateChangeTypeAccount(typeAccount: typeAccount));
    } else if (event is BlocSignUpEventChangeFirstName) {
      firstName = event.firstName;
    } else if (event is BlocSignUpEventChangeLastName) {
      lastName = event.lastName;
    } else if (event is BlocSignUpEventChangeCountry) {
      country = event.country;
    } else if (event is BlocSignUpEventChangeEmail) {
      isValidEmail = true;
      email = event.email;
    } else if (event is BlocSignUpEventChangePassword) {
      password = event.password;
    } else if (event is BlocSignUpEventChangeConfirmPassword) {
      confirmPassword = event.confirmPassword;
    } else if (event is BlocSignUpEventTermAndConditionsClick) {
      Routes.navigateTo(AppPath.termAndCondition, {});
    } else if (event is BlocSignUpEventSignInClick) {
      Routes.backTo();
    }
  }

  String? validateTextFieldEmail(String? value) {
    if (!isValidEmail) {
      return 'The email has been used';
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
