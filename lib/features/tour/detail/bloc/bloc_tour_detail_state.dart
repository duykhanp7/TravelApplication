import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

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
  BlocTourDetailStateLoading({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocTourDetailStateShowBottomSheetShare extends BlocTourDetailState {
  BlocTourDetailStateShowBottomSheetShare({required this.current});
  final int current;

  @override
  List<Object?> get props => [current];
}

class BlocTourDetailStateBookThisTourResult extends BlocTourDetailState {
  BlocTourDetailStateBookThisTourResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
