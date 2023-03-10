import 'package:equatable/equatable.dart';

abstract class BlocTourDetailState extends Equatable {}

class BlocTourDetailStateInitial extends BlocTourDetailState {
  BlocTourDetailStateInitial();
  @override
  List<Object?> get props => [];
}

class BlocTourDetailStateChangeIndexImageSlider extends BlocTourDetailState {
  BlocTourDetailStateChangeIndexImageSlider({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class BlocTourDetailStateChangeIndexSchedule extends BlocTourDetailState {
  BlocTourDetailStateChangeIndexSchedule({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class BlocTourDetailStateLoading extends BlocTourDetailState {
  BlocTourDetailStateLoading();
  @override
  List<Object?> get props => [];
}

class BlocTourDetailStateLoadingFail extends BlocTourDetailState {
  BlocTourDetailStateLoadingFail();
  @override
  List<Object?> get props => [];
}

class BlocTourDetailStateLoadingSuccess extends BlocTourDetailState {
  BlocTourDetailStateLoadingSuccess();
  @override
  List<Object?> get props => [];
}
