import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/tour_detail_json.dart';

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
  BlocTourDetailEventClickButtonBookThisTour({required this.tourDetailJson});
  final TourDetailJson tourDetailJson;
  @override
  List<Object?> get props => [tourDetailJson];
}
