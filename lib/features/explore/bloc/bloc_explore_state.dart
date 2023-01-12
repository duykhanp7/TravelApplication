import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/features/explore/model/best_guide.dart';
import 'package:travel_booking_tour/features/explore/model/feature_tour.dart';
import 'package:travel_booking_tour/features/explore/model/top_experiences.dart';
import 'package:travel_booking_tour/features/explore/model/top_journey.dart';
import 'package:travel_booking_tour/features/explore/model/travel_news.dart';

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
