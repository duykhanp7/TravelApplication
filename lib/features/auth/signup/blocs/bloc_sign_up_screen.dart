import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_event.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

class BlocSignupScreen extends Bloc<BlocSignUpEvent, BlocSignUpState> {
  int typeAccount = 0;
  String? firstName;
  String? lastName;
  String? country;
  String? email;
  String? password;
  String? confirmPassword;
  bool isValidEmail = true;

  //final AuthRepository _authRepository = AuthRepository();

  BlocSignupScreen() : super(BlocSignUpStateInitial()) {
    on<BlocSignUpEvent>((event, emit) => mapEventToState(event, emit));
  }

  void mapEventToState(
      BlocSignUpEvent event, Emitter<BlocSignUpState> emit) async {
    if (event is BlocSignUpEventValidate) {
      emit(BlocSignUpStateValidateLoading());
      if (typeAccount == 0) {
        emit(BlocSignUpStateValidateSuccess());
      } else if (typeAccount == 1) {
        Routes.navigateTo(AppPath.tourGuideAddProfile, {});
      }
      // if (event.signUpGlobalKey.currentState?.validate() ?? false) {
      //   try {
      //     Map<String, dynamic> data = {
      //       "email": email,
      //       "username": email,
      //       "password": password,
      //       "fisrtName": firstName,
      //       "lastName": lastName
      //     };
      //     final UserJson? user = await _authRepository.signUp(data);
      //     if (user != null) {
      //       emit(BlocSignUpStateValidateSuccess());
      //     }
      //   } on NetworkException catch (ex) {
      //     debugPrint('Expcetion Sign Up ${ex.toString()}');
      //     if (ex.statusCode == 0 ||
      //         ex.statusCode == 500 ||
      //         ex.statusCode == 503 ||
      //         ex.statusCode == 401) {
      //       emit(BlocSignUpStateServerError());
      //     } else {
      //       isValidEmail = false;
      //       event.signUpGlobalKey.currentState?.validate();
      //       emit(BlocSignUpStateValidateFail());
      //     }
      //   }
      // } else {
      //   emit(BlocSignUpStateValidateFail());
      // }
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
      return 'The email has been not signed up';
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
