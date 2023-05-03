import 'package:equatable/equatable.dart';

abstract class BlocTourDetailEvent extends Equatable {}

class BlocTourDetailEventInitial extends BlocTourDetailEvent {
  BlocTourDetailEventInitial();
  @override
  List<Object?> get props => [];
}

class BlocTourDetailEventChangeIndexImageSlider extends BlocTourDetailEvent {
  BlocTourDetailEventChangeIndexImageSlider({required this.index});
  final int index;

  @override
  List<Object?> get props => [index];
}

class BlocTourDetailEventChangeIndexSchedule extends BlocTourDetailEvent {
  BlocTourDetailEventChangeIndexSchedule({required this.index});
  final int index;

  @override
  List<Object?> get props => [index];
}

class BlocTourDetailEventShowBottomSheetShare extends BlocTourDetailEvent {
  BlocTourDetailEventShowBottomSheetShare();
  @override
  List<Object?> get props => [];
}

class BlocTourDetailEventClickButtonBookThisTour extends BlocTourDetailEvent {
  BlocTourDetailEventClickButtonBookThisTour();
  @override
  List<Object?> get props => [];
}
