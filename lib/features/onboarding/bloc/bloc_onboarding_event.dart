import 'package:equatable/equatable.dart';

abstract class BlocOnboardingEvent extends Equatable {}

class BlocOnboardingEventInitial extends BlocOnboardingEvent {
  @override
  List<Object?> get props => [];
}

class BlocOnboardingEventOnButtonSkipClick extends BlocOnboardingEvent {
  @override
  List<Object?> get props => [];
}

class BlocOnboardingEventOnButtonGetStartedClick extends BlocOnboardingEvent {
  @override
  List<Object?> get props => [];
}
