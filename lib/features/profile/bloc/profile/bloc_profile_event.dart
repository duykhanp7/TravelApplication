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
