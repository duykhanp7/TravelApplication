import 'package:equatable/equatable.dart';

abstract class BlocProfileEvent extends Equatable {}

class BlocProfileEventInitial extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocProfileEventShowMoreMyPhotos extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocProfileEventShowMyJourneys extends BlocProfileEvent {
  @override
  List<Object?> get props => [];
}
