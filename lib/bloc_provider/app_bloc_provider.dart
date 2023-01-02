import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/features/signup/bloc/bloc_sign_up_screen.dart';

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
  ];
}
