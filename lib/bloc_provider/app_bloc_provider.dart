import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/features/auth/signup/bloc/bloc_sign_up_tour_guide_information_screen.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_screen.dart';
import 'package:travel_booking_tour/features/forgot_password/bloc/bloc_forgot_password_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_screen.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_screen.dart';
import 'package:travel_booking_tour/features/auth/signin/bloc/bloc_sign_in_screen.dart';
import 'package:travel_booking_tour/features/auth/signup/bloc/bloc_sign_up_screen.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_search_system_screen.dart';
import 'package:travel_booking_tour/features/my_trip/bloc/bloc_my_trips_screen.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/bloc/bloc_terms_and_conditions_screen.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_screen.dart';

import '../features/explore/bloc/bloc_see_more_screen.dart';
import '../features/guide/choose_guide/bloc/bloc_add_trip_information_screen.dart';
import '../features/onboarding/bloc/bloc_onboarding_screen.dart';
import '../features/splash/bloc/bloc_splash_event.dart';
import '../features/splash/bloc/bloc_splash_screen.dart';

class AppBlocProvider {
  static final List<BlocProvider> providers = <BlocProvider>[
    BlocProvider<BlocSplashScreen>(
      create: (context) => BlocSplashScreen()..add(BlocSplashEventInitial()),
    ),
    BlocProvider<BlocOnboardingScreen>(
      create: (context) => BlocOnboardingScreen(),
    ),
    BlocProvider<BlocSignupScreen>(
      create: (context) => BlocSignupScreen(),
    ),
    BlocProvider<BlocSignInScreen>(
      create: (context) => BlocSignInScreen(),
    ),
    BlocProvider<BlocForgotPasswordScreen>(
      create: (context) => BlocForgotPasswordScreen(),
    ),
    BlocProvider<BlocMainScreen>(
      create: (context) => BlocMainScreen(),
    ),
    BlocProvider<BlocExploreScreen>(
      create: (context) => BlocExploreScreen(),
    ),
    BlocProvider<BlocDetailGuideScreen>(
        create: (context) => BlocDetailGuideScreen()),
    BlocProvider<BlocTripInformationScreen>(
        create: (context) => BlocTripInformationScreen()),
    BlocProvider<BlocTermsAndConditionsScreen>(
        create: (context) => BlocTermsAndConditionsScreen()),
    BlocProvider<BlocSignUpTourGuideInformationScreen>(
        create: (context) => BlocSignUpTourGuideInformationScreen()),
    BlocProvider<BlocTourDetailScreen>(
        create: (context) => BlocTourDetailScreen()),
    BlocProvider<BlocSeeMoreScreen>(create: (context) => BlocSeeMoreScreen()),
    BlocProvider<BlocSearchSystemScreen>(
        create: (context) => BlocSearchSystemScreen()),
    BlocProvider<BlocMyTripScreen>(create: (context) => BlocMyTripScreen()),
  ];
}
