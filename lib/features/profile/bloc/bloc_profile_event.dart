import 'package:equatable/equatable.dart';

abstract class BlocProfileEvent extends Equatable {}

class BlocProfileEventShowMoreMyPhotos extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocProfileEventShowMyJourneys extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocProfileEventAddMoreMyPhotos extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocProfileEventAddMoreMyJourneys extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocProfileEventLoadLocalImages extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}
