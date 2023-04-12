import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/features/empty/empty.dart';
import 'package:travel_booking_tour/features/explore/screen/see_more_screen.dart';
import 'package:travel_booking_tour/features/forgot_password/screen/check_email_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/screen/guide_description._screen.dart';
import 'package:travel_booking_tour/features/main/screen/main_page.dart';
import 'package:travel_booking_tour/features/main/screen/search_system.dart';
import 'package:travel_booking_tour/features/my_trip/screen/trip_view_detail.dart';
import 'package:travel_booking_tour/features/payment/screen/payment_screen.dart';
import 'package:travel_booking_tour/features/profile/screen/my_journeys_screen.dart';
import 'package:travel_booking_tour/features/profile/screen/my_photos_screen.dart';
import 'package:travel_booking_tour/features/profile/screen/profile_add_more_journeys.dart';
import 'package:travel_booking_tour/features/profile/screen/profile_add_more_photos.dart';
import 'package:travel_booking_tour/features/setting/screen/change_password_screen.dart';
import 'package:travel_booking_tour/features/setting/screen/editing_profile_screen.dart';
import 'package:travel_booking_tour/features/setting/screen/setting_screen.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:travel_booking_tour/features/tour/detail/tour_detail_screen.dart';
import 'package:travel_booking_tour/res/app_camera.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../common/enum/enums.dart';
import '../features/auth/signup/screen/sign_up_screen.dart';
import '../features/auth/signup/screen/sign_up_tour_guide_information_screen.dart';
import '../features/forgot_password/forgot_password_screen.dart';
import '../features/guide/choose_guide/screen/add_new_places_screen.dart';
import '../features/guide/choose_guide/screen/edit_trip_information_page.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/auth/signin/sign_in_screen.dart';
import '../features/splash/splash_screen.dart';

class Routes {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();

  static late List<CameraDescription> cameras;
  static CameraOrRecorder cameraType = CameraOrRecorder.camera;

  static String initialRoute = AppPath.splashScreen;

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
    AppPath.editTripInformation: (context) => const EditTripInformationScreen(),
    AppPath.addNewPlaces: (context) => const AddNewPlacesScreen(),
    AppPath.termAndCondition: (context) => const TermAndConditionScreen(),
    AppPath.tourGuideAddProfile: (context) =>
        const SignUpTourGuideInformationScreen(),
    AppPath.tourDetail: (context) => const TourDetailScreen(),
    AppPath.seeMore: (context) => const SeeMoreScreen(),
    AppPath.searchSystem: (context) => const SearchSystem(),
    AppPath.tripViewDetail: (context) => const TripViewDetail(),
    AppPath.payment: (context) => const PaymentScreen(),
    AppPath.settings: (context) => const SettingScreen(),
    AppPath.editingProfile: (context) => const EditingProfile(),
    AppPath.settingChangePassword: (context) => const ChangePasswordScreen(),
    AppPath.myPhotos: (context) => const MyPhotosScreen(),
    AppPath.myPhotosAddMore: (context) => const ProfileAddMorePhotos(),
    AppPath.myJourneysAddMore: (context) => const ProfileAddMoreJourneys(),
    AppPath.myJourneys: (context) => const MyJourneysScreen(),
  };

  static Future<void> initializedCamera() async {
    cameras = await availableCameras();
  }

  static Future<T?> navigateToAndRemoveUntil<T>(
          String namePage, Map<String, dynamic> arguments) async =>
      navigator.currentState?.pushNamedAndRemoveUntil<T>(
          namePage, (route) => false,
          arguments: arguments);

  static Future<T?> navigateTo<T>(
          String namePage, Map<String, dynamic> arguments) async =>
      navigator.currentState?.pushNamed(
        namePage,
        arguments: arguments,
      );

  static Future<T?> navigatoReplacement<T>(
          String namePage, Map<String, dynamic> arguments) async =>
      navigator.currentState
          ?.pushReplacementNamed(namePage, arguments: arguments);

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

  static void backToUntilPage(String namePage) {
    navigator.currentState
        ?.popUntil((route) => route.settings.name == namePage);
  }
}
