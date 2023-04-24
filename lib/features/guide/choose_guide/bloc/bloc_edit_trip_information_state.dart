import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

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

class BlocTripInformationStateSearchDestination
    extends BlocTripInformationState {
  BlocTripInformationStateSearchDestination({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocTripInformationStateClose extends BlocTripInformationState {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationStateLoadDestination extends BlocTripInformationState {
  BlocTripInformationStateLoadDestination({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
