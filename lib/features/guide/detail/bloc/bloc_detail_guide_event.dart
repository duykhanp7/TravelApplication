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

class BlocDetailGuideEventClose extends BlocDetailGuideEvent {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideEventChooseThisGuide extends BlocDetailGuideEvent {
  BlocDetailGuideEventChooseThisGuide({required this.current});
  final int current;
  @override
  List<Object?> get props => [current];
}
