import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/auth/signin/blocs/bloc_sign_in_event.dart';
import 'package:travel_booking_tour/features/auth/signin/blocs/bloc_sign_in_state.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../../router/routes.dart';
// import '../../signup/repositories/auth_repository.dart';

class BlocSignInScreen extends Bloc<BlocSignInEvent, BlocSignInState> {
  String? email;
  String? password;
  bool isValidEmail = true;
  //final AuthRepository _authRepository = AuthRepository();

  BlocSignInScreen() : super(BlocSignInStateInitial()) {
    on<BlocSignInEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(
      BlocSignInEvent event, Emitter<BlocSignInState> emit) async {
    if (event is BlocSignInEventSignInClick) {
      emit(BlocSignInStateValidateSuccess());

      // emit(BlocSignInStateValidateLoading());
      // if (event.signInGlobalKey.currentState?.validate() ?? false) {
      //   try {
      //     Map<String, dynamic> data = {
      //       "identifier": email,
      //       "password": password
      //     };
      //     UserJson? userJson = await _authRepository.signIn(data);
      //     debugPrint('Login Fail ${userJson.toString()}');
      //     if (userJson != null) {
      //       emit(BlocSignInStateValidateSuccess());
      //     }
      //   } on NetworkException catch (ex) {
      //     debugPrint('Expcetion Sign In ${ex.toString()}');
      //     if (ex.statusCode == 0 ||
      //         ex.statusCode == 500 ||
      //         ex.statusCode == 503 ||
      //         ex.statusCode == 401) {
      //       emit(BlocSignInStateServerError());
      //     } else {
      //       isValidEmail = false;
      //       event.signInGlobalKey.currentState?.validate();
      //       emit(BlocSignInStateValidateFail());
      //     }
      //   }
      // } else {
      //   emit(BlocSignInStateValidateFail());
      // }
    } else if (event is BlocSignInEventSignUpClick) {
      Routes.navigateTo(AppPath.signUpScreen, {});
    } else if (event is BlocSignInEventForgotPassword) {
      Routes.navigateTo(AppPath.forgotPassword, {});
    } else if (event is BlocSignInEventChangeEmail) {
      isValidEmail = true;
      email = event.email;
    } else if (event is BlocSignInEventChangePassword) {
      password = event.password;
    }
  }

  String? validateTextFieldEmail(String? value) {
    if (!isValidEmail) {
      return 'This email has not been signed up, try sign up';
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
