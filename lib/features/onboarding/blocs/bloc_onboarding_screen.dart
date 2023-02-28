import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/onboarding/blocs/bloc_onboarding_event.dart';
import 'package:travel_booking_tour/features/onboarding/blocs/bloc_onboarding_state.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../router/routes.dart';

class BlocOnboardingScreen
    extends Bloc<BlocOnboardingEvent, BlocOnboardingState> {
  BlocOnboardingScreen() : super(BlocOnboardingStateInitial()) {
    on<BlocOnboardingEventOnButtonSkipClick>((event, emit) =>
        {Routes.navigateToAndRemoveUntil(AppPath.signUpScreen, {})});
    on<BlocOnboardingEventOnButtonGetStartedClick>((event, emit) =>
        {Routes.navigateToAndRemoveUntil(AppPath.signUpScreen, {})});
  }
}
