import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_state.dart';
import 'package:travel_booking_tour/features/explore/model/best_guide.dart';
import 'package:travel_booking_tour/features/explore/model/feature_tour.dart';
import 'package:travel_booking_tour/features/explore/model/top_experiences.dart';
import 'package:travel_booking_tour/features/explore/model/top_journey.dart';
import 'package:travel_booking_tour/features/explore/model/travel_news.dart';
import 'package:travel_booking_tour/features/explore/repository/explore_repository.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../router/routes.dart';

class BlocExploreScreen extends Bloc<BlocExploreEvent, BlocExploreState> {
  final ExploreRepository _exploreRepository = ExploreRepository();

  BlocExploreScreen() : super(BlocExploreStateInitial()) {
    on<BlocExploreEventInitial>((event, emit) async {
      List<TopJourneyJson> topJourneyJsons = [];
      List<BestGuideJson> bestGuideJsons = [];
      List<TopExperienceJson> topExperienceJsons = [];
      List<FeatureTourJson> featuresTourJsons = [];
      List<TravelNewJson> travelNewJsons = [];
      await Future.forEach(event.objects!, (element) async {
        if (element is FeatureTourJson) {
          featuresTourJsons = await _exploreRepository.getListFeatureTour();
        } else if (element is BestGuideJson) {
          bestGuideJsons = await _exploreRepository.getListBestGuide();
        } else if (element is TopExperienceJson) {
          topExperienceJsons = await _exploreRepository.getListTopExperiences();
        } else if (element is TopJourneyJson) {
          topJourneyJsons = await _exploreRepository.getListTopJourney();
        } else if (element is TravelNewJson) {
          travelNewJsons = await _exploreRepository.getListTravelNews();
        } else {
          debugPrint('Not Valid type');
        }
      });

      emit(BlocExploreStateLoadDataSuccess(
          topJourneyJsons: topJourneyJsons,
          bestGuideJsons: bestGuideJsons,
          topExperienceJsons: topExperienceJsons,
          featuresTourJsons: featuresTourJsons,
          travelNewJsons: travelNewJsons));
    });
    on<BlocExploreEventReloadData>((event, emit) {});
    on<BlocExploreEventOnTopJourneyClick>((event, emit) {
      Routes.navigateTo(AppPath.guide, {});
    });
  }
}
