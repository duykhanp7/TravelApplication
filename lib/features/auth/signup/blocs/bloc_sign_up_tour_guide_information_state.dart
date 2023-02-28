import 'package:equatable/equatable.dart';

abstract class BlocSignUpTourGuideInformationState extends Equatable {}

class BlocSignUpTourGuideInformationStateInitial
    extends BlocSignUpTourGuideInformationState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationStateChangeIndexDate
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStateChangeIndexDate({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class BlocSignUpTourGuideInformationStateChangeStep
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStateChangeStep({required this.step});
  final int step;
  @override
  List<Object?> get props => [step];
}
