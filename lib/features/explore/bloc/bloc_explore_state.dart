import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/features/explore/models/best_guide_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/feature_tour_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/top_experiences_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/top_journey_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/travel_news_preview_json.dart';

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
  final List<TopJourneyJson> topJourneyJsons;
  final List<BestGuideJson> bestGuideJsons;
  final List<TopExperienceJson> topExperienceJsons;
  final List<FeatureTourJson> featuresTourJsons;
  final List<TravelNewJson> travelNewJsons;

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
