import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_state.dart';
import 'package:travel_booking_tour/features/explore/models/best_guide_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/feature_tour_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/top_experiences_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/top_journey_preview_json.dart';
import 'package:travel_booking_tour/features/explore/models/travel_news_preview_json.dart';
import 'package:travel_booking_tour/features/explore/repositories/explore_repository.dart';
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
    on<BlocExploreEventOnTopJourneyClick>((event, emit) {});
    on<BlocExploreEventOnBestGuideClick>((event, emit) {
      Routes.navigateTo(AppPath.guide, {'video': event.videoUrl});
    });
  }
}
