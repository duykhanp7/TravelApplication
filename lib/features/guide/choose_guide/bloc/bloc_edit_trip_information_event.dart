import 'package:equatable/equatable.dart';

abstract class BlocTripInformationEvent extends Equatable {}

class BlocTripInformationEventInitial extends BlocTripInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventChangeDate extends BlocTripInformationEvent {
  BlocTripInformationEventChangeDate({required this.date});
  final String date;
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventChangeTimeFrom extends BlocTripInformationEvent {
  BlocTripInformationEventChangeTimeFrom({required this.timeFrom});
  final String timeFrom;
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventChangeTimeTo extends BlocTripInformationEvent {
  BlocTripInformationEventChangeTimeTo({required this.timeTo});
  final String timeTo;
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventChangeCity extends BlocTripInformationEvent {
  BlocTripInformationEventChangeCity({required this.city});
  final String city;
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventChangeNumberOfTravelers
    extends BlocTripInformationEvent {
  BlocTripInformationEventChangeNumberOfTravelers(
      {required this.numberOfTravelers});
  final String numberOfTravelers;
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventChangeAddNewAttractions
    extends BlocTripInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventDone extends BlocTripInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventAddNumberOfTravelers
    extends BlocTripInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocTripInformationEventSubtractNumberOfTravelers
    extends BlocTripInformationEvent {
  @override
  List<Object?> get props => [];
}

// class BlocTripInformationEventCheckAttractions
//     extends BlocTripInformationEvent {
//   @override
//   List<Object?> get props => [];
// }

// class BlocTripInformationEventUnCheckAttractions
//     extends BlocTripInformationEvent {
//   @override
//   List<Object?> get props => [];
// }

class BlocTripInformationEventSearchDestination
    extends BlocTripInformationEvent {
  BlocTripInformationEventSearchDestination({required this.name});
  final String name;
  @override
  List<Object?> get props => [name];
}

class BlocTripInformationEventBack extends BlocTripInformationEvent {
  BlocTripInformationEventBack();
  @override
  List<Object?> get props => [];
}
