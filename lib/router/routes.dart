import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/features/empty/empty.dart';
import 'package:travel_booking_tour/features/forgot_password/forgot_password_screen.dart';
import 'package:travel_booking_tour/features/forgot_password/screens/check_email_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/guide_description._screen.dart';
import 'package:travel_booking_tour/features/guide/detail/widgets/choose_guide_trip_information_page.dart';
import 'package:travel_booking_tour/features/main/main_page.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../features/onboarding/onboarding_screen.dart';
import '../features/signin/sign_in_screen.dart';
import '../features/signup/sign_up_screen.dart';
import '../features/splash/splash_screen.dart';

class Routes {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();

  static final routes = {
    AppPath.splashScreen: (context) => const SplashScreen(),
    AppPath.onBoardingSCreen: (context) => const OnboardingScreen(),
    AppPath.mainScreen: (context) => const MainPage(),
    AppPath.signUpScreen: (context) => const SignUpScreen(),
    AppPath.signInScreen: (context) => const SignInScreen(),
    AppPath.forgotPassword: (context) => const ForgotPasswordScreen(),
    AppPath.checkEmail: (context) => const CheckEmailScreen(),
    AppPath.empty: (context) => const EmptyPage(),
    AppPath.guide: (context) => const GuideDescriptionScreen(),
    AppPath.chooseGuideTripInformation: (context) =>
        const ChooseGuideTripInformationPage(),
  };

  static void navigateToAndRemoveUntil(
      String namePage, Map<String, dynamic> arguments) {
    navigator.currentState?.pushNamedAndRemoveUntil(namePage, (route) => false,
        arguments: arguments);
  }

  static void navigateTo(String namePage, Map<String, dynamic> arguments) {
    navigator.currentState?.pushNamed(
      namePage,
      arguments: arguments,
    );
  }

  static void backTo({String? namePage, Map<String, dynamic>? arguments}) {
    namePage == null
        ? navigator.currentState?.pop()
        : navigator.currentState
            ?.popAndPushNamed(namePage, arguments: arguments);
  }
}
