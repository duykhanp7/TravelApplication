import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/enums/enums.dart';
import 'package:travel_booking_tour/features/empty/empty.dart';
import 'package:travel_booking_tour/features/explore/screen/see_more_screen.dart';
import 'package:travel_booking_tour/features/forgot_password/screen/check_email_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/screens/guide_description._screen.dart';
import 'package:travel_booking_tour/features/main/screen/main_page.dart';
import 'package:travel_booking_tour/features/main/screen/search_system.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:travel_booking_tour/features/tour/detail/tour_detail_screen.dart';
import 'package:travel_booking_tour/res/app_camera.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../features/auth/signup/screen/sign_up_screen.dart';
import '../features/auth/signup/screen/sign_up_tour_guide_information_screen.dart';
import '../features/forgot_password/forgot_password_screen.dart';
import '../features/guide/choose_guide/screen/add_new_places_screen.dart';
import '../features/guide/choose_guide/screen/choose_guide_trip_information_page.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/auth/signin/sign_in_screen.dart';
import '../features/splash/splash_screen.dart';

class Routes {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();

  static late List<CameraDescription> cameras;
  static CameraOrRecorder cameraType = CameraOrRecorder.camera;

  static final routes = {
    AppPath.splashScreen: (context) => const SplashScreen(),
    AppPath.onBoardingSCreen: (context) => const OnboardingScreen(),
    AppPath.mainScreen: (context) => const MainPage(),
    AppPath.signUpScreen: (context) => SignUpScreen(),
    AppPath.signInScreen: (context) => const SignInScreen(),
    AppPath.forgotPassword: (context) => const ForgotPasswordScreen(),
    AppPath.checkEmail: (context) => const CheckEmailScreen(),
    AppPath.empty: (context) => const EmptyPage(),
    AppPath.guide: (context) => const GuideDescriptionScreen(),
    AppPath.chooseGuideTripInformation: (context) =>
        const ChooseGuideTripInformationScreen(),
    AppPath.addNewPlaces: (context) => const AddNewPlacesScreen(),
    AppPath.termAndCondition: (context) => const TermAndConditionScreen(),
    AppPath.tourGuideAddProfile: (context) =>
        const SignUpTourGuideInformationScreen(),
    AppPath.tourDetail: (context) => const TourDetailScreen(),
    AppPath.seeMore: (context) => const SeeMoreScreen(),
    AppPath.searchSystem: (context) => const SearchSystem(),
  };

  static Future<void> initializedCamera() async {
    cameras = await availableCameras();
  }

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

  static void navigatoReplacement(
      String namePage, Map<String, dynamic> arguments) {
    navigator.currentState
        ?.pushReplacementNamed(namePage, arguments: arguments);
  }

  static Future<XFile?> navigateToCamera() async {
    await initializedCamera();
    return await navigator.currentState?.push(MaterialPageRoute(
        builder: (context) =>
            AppCamera(cameras: cameras, cameraOrRecorder: cameraType)));
  }

  static void backTo({String? namePage, Map<String, dynamic>? arguments}) {
    namePage == null
        ? navigator.currentState?.pop(arguments)
        : navigator.currentState
            ?.popAndPushNamed(namePage, arguments: arguments);
  }
}
