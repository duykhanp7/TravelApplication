import 'package:equatable/equatable.dart';

abstract class BlocDetailGuideEvent extends Equatable {}

class BlocDetailGuideEventInitial extends BlocDetailGuideEvent {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideEventBack extends BlocDetailGuideEvent {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideEventLoadVideo extends BlocDetailGuideEvent {
  BlocDetailGuideEventLoadVideo({required this.videoUrl});
  final String videoUrl;
  @override
  List<Object?> get props => [videoUrl];
}

class BlocDetailGuideEventClose extends BlocDetailGuideEvent {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideEventChooseThisGuide extends BlocDetailGuideEvent {
  @override
  List<Object?> get props => [];
}
