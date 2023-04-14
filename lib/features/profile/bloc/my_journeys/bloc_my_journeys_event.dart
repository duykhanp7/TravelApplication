import 'package:equatable/equatable.dart';

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
