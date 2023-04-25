import 'package:camera/camera.dart';
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

class BlocProfileEventUpdateAvatar extends BlocProfileEvent {
  BlocProfileEventUpdateAvatar({required this.avatar});
  final XFile avatar;
  @override
  List<Object?> get props => [avatar];
}

class BlocProfileEventUpdateCover extends BlocProfileEvent {
  BlocProfileEventUpdateCover({required this.cover});
  final XFile cover;
  @override
  List<Object?> get props => [cover];
}
