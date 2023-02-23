import 'package:equatable/equatable.dart';

abstract class BlocTripInformationState extends Equatable {}

class BlocTripInformationStateInitial extends BlocTripInformationState {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationStateCheck extends BlocTripInformationState {
  BlocTripInformationStateCheck({required this.current});
  final int current;
  @override
  List<Object?> get props => [current];
}
