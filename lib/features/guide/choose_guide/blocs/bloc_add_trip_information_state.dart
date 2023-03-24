import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/model/destination_json.dart';

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

class BlocTripInformationStateSearchDestinationLoading
    extends BlocTripInformationState {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationStateSearchDestinationLoadingSuccess
    extends BlocTripInformationState {
  BlocTripInformationStateSearchDestinationLoadingSuccess({required this.data});
  final List<DestinationJson> data;
  @override
  List<Object?> get props => [];
}

class BlocTripInformationStateSearchDestinationLoadingFail
    extends BlocTripInformationState {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationStateClose extends BlocTripInformationState {
  @override
  List<Object?> get props => [];
}
