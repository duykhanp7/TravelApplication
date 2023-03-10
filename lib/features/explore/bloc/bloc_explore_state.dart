import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/models/tour_detail_json.dart';
import 'package:travel_booking_tour/data/models/tour_guide_detail_json.dart';

abstract class BlocExploreState extends Equatable {}

class BlocExploreStateInitial extends BlocExploreState {
  @override
  List<Object?> get props => [];
}

class BlocExploreStateLoading extends BlocExploreState {
  @override
  List<Object?> get props => [];
}

class BlocExploreStateReload extends BlocExploreState {
  @override
  List<Object?> get props => [];
}

class BlocExploreStateLoadDataSuccess extends BlocExploreState {
  final List<TourDetailJson> topJourneyJsons;
  final List<TourGuideDetailJson> bestGuideJsons;
  final List<TourDetailJson> topExperienceJsons;
  final List<TourDetailJson> featuresTourJsons;
  final List<TourDetailJson> travelNewJsons;

  BlocExploreStateLoadDataSuccess(
      {required this.topJourneyJsons,
      required this.bestGuideJsons,
      required this.topExperienceJsons,
      required this.featuresTourJsons,
      required this.travelNewJsons});

  @override
  List<Object?> get props => [];
}

class BlocExploreStateLoadDataFail extends BlocExploreState {
  @override
  List<Object?> get props => [];
}
