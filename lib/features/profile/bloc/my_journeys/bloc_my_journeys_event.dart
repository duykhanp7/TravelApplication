import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';

abstract class BlocMyJourneysEvent extends Equatable {}

class BlocMyJourneysEventInitial extends BlocMyJourneysEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyJourneysEventClickButtonAddJourney extends BlocMyJourneysEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyJourneysEventClickButtonDone extends BlocMyJourneysEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyJourneysEventClickButtonUploadPhotos extends BlocMyJourneysEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyJourneysEventDeleteJourney extends BlocMyJourneysEvent {
  BlocMyJourneysEventDeleteJourney({required this.myExperienceJson});
  final MyExperienceJson? myExperienceJson;
  @override
  List<Object?> get props => [myExperienceJson];
}
