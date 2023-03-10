import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/data/models/tour_detail_json.dart';
import 'package:travel_booking_tour/data/models/tour_guide_detail_json.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_state.dart';
import 'package:travel_booking_tour/features/explore/repositories/explore_repository.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../common/enums/enums.dart';
import '../../../router/routes.dart';

class BlocExploreScreen extends Bloc<BlocExploreEvent, BlocExploreState> {
  final ExploreRepository _exploreRepository = ExploreRepository();

  BlocExploreScreen() : super(BlocExploreStateInitial()) {
    on<BlocExploreEventInitial>((event, emit) async {
      List<TourDetailJson> topJourneyJsons = [];
      List<TourGuideDetailJson> bestGuideJsons = [];
      List<TourDetailJson> topExperienceJsons = [];
      List<TourDetailJson> featuresTourJsons = [];
      List<TourDetailJson> travelNewJsons = [];
      await Future.forEach(event.objects!, (element) async {
        if (element == TypeDestination.featureTourJson) {
          featuresTourJsons = await _exploreRepository.getListTopJourney();
        } else if (element == TypeDestination.bestGuideJson) {
          bestGuideJsons = await _exploreRepository.getListTourGuide();
        } else if (element == TypeDestination.topExperienceJson) {
          topExperienceJsons = await _exploreRepository.getListTopJourney();
        } else if (element == TypeDestination.topJourneyJson) {
          topJourneyJsons = await _exploreRepository.getListTopJourney();
        } else if (element == TypeDestination.travelNewJson) {
          travelNewJsons = await _exploreRepository.getListTopJourney();
        } else {}
      });

      emit(BlocExploreStateLoadDataSuccess(
          topJourneyJsons: topJourneyJsons,
          bestGuideJsons: bestGuideJsons,
          topExperienceJsons: topExperienceJsons,
          featuresTourJsons: featuresTourJsons,
          travelNewJsons: travelNewJsons));
    });
    on<BlocExploreEventReloadData>((event, emit) {});
    on<BlocExploreEventOnTourClick>((event, emit) {
      Routes.navigateTo(AppPath.tourDetail, {'data': event.tourDetailJson});
    });
    on<BlocExploreEventOnBestGuideClick>((event, emit) {
      Routes.navigateTo(AppPath.guide, {'data': event.tourGuideDetailJson});
    });
  }

  Future<TourGuideDetailJson> getTourGuideDetail(int id) async {
    return await _exploreRepository.getTourGuideDetail(id);
  }
}
