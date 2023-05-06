import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:travel_booking_tour/common/app_logger.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/features/auth/signin/bloc/bloc_sign_in_event.dart';
import 'package:travel_booking_tour/features/auth/signin/bloc/bloc_sign_in_state.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../../common/enum/enums.dart';
import '../../../../data/model/user.dart';
import '../../../../data/network/network_exception.dart';
import '../../../../router/routes.dart';
import '../../repository/auth_repository.dart';

class BlocSignInScreen extends Bloc<BlocSignInEvent, BlocSignInState> {
  String? email;
  String? password;
  bool isValidEmail = true;
  final AuthRepository _authRepository = AuthRepository();
  final AppStorage _appStorage = AppStorage();
  String errorText = 'This email has not been signed up, try sign up';
  final GlobalKey<FormState> signInGlobalKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  BlocSignInScreen() : super(BlocSignInStateInitial()) {
    on<BlocSignInEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(
      BlocSignInEvent event, Emitter<BlocSignInState> emit) async {
    if (event is BlocSignInEventSignInClick) {
      emit(BlocSignInStateValidate(
          appResult: AppResult(state: ResultState.loading)));
      if (signInGlobalKey.currentState?.validate() ?? false) {
        try {
          Map<String, dynamic> data = {
            "identifier": email,
            "password": password
          };

          UserJson? userJson = await _authRepository.signIn(data);
          if (userJson != null) {
            String json = jsonEncode(userJson);
            _appStorage.saveData(AppConstant.user, json);
            _appStorage.saveData(AppConstant.password, password ?? '');
            emit(BlocSignInStateValidate(
                appResult: AppResult(state: ResultState.success)));
            emailEditingController.text = '';
            passwordEditingController.text = '';
          }
        } on NetworkException catch (ex) {
          debugPrint('Expcetion Sign In ${ex.toString()}');
          errorText = ex.getTextError;
          if (ex.statusCode == 0 ||
              ex.statusCode == 500 ||
              ex.statusCode == 503 ||
              ex.statusCode == 401) {
            emit(BlocSignInStateValidate(
                appResult: AppResult(state: ResultState.error)));
          } else {
            isValidEmail = false;
            signInGlobalKey.currentState?.validate();
            emit(BlocSignInStateValidate(
                appResult: AppResult(state: ResultState.fail)));
          }
        }
      } else {
        emit(BlocSignInStateValidate(
            appResult: AppResult(state: ResultState.fail)));
      }
    } else if (event is BlocSignInEventSignUpClick) {
      emailEditingController.text = '';
      passwordEditingController.text = '';
      signInGlobalKey.currentState?.reset();
      Routes.navigateTo(AppPath.signUpScreen, {});
    } else if (event is BlocSignInEventForgotPassword) {
      Routes.navigateTo(AppPath.forgotPassword, {});
    } else if (event is BlocSignInEventChangeEmail) {
      isValidEmail = true;
      email = event.email;
      errorText = 'This email has not been signed up, try sign up';
    } else if (event is BlocSignInEventChangePassword) {
      password = event.password;
    } else if (event is BlocSignInEventLoginWithGoogle) {
      try {
        emit(BlocSignInStateLoginWithGoogle(
            appResult: AppResult(state: ResultState.loading)));
        if (FirebaseAuth.instance.currentUser == null) {
          User? user = await signInWithGoogle();
          if (user != null) {
            debugPrint(
                'User Google Account Info : ${user.email} ${user.displayName} ${user.phoneNumber}');
            emit(BlocSignInStateLoginWithGoogle(
                appResult:
                    AppResult(state: ResultState.success, result: user)));
          } else {
            emit(BlocSignInStateLoginWithGoogle(
                appResult: AppResult(state: ResultState.fail)));
          }
        }
      } on NetworkException catch (e) {
        emit(BlocSignInStateLoginWithGoogle(
            appResult: AppResult(state: ResultState.fail)));

        AppLogger.loggerOnNetworkException(e);
      }
    } else if (event is BlocSignInEventLoginWithFacebook) {}
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser != null) {
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken, idToken: gAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
      return FirebaseAuth.instance.currentUser;
    }
    return null;
  }

  String? validateTextFieldEmail(String? value) {
    if (!isValidEmail) {
      return errorText;
    } else if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else {
      final bool emailValid = AppValidator.isValidEmailFormat(value);
      if (!emailValid) {
        return 'Email is invalid';
      }
    }
    return null;
  }

  String? validateTextFieldPaswordLogIn(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
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
}
