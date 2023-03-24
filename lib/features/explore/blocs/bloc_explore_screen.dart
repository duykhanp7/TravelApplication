import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/data/models/tour_detail_json.dart';
import 'package:travel_booking_tour/data/models/tour_guide_detail_json.dart';
import 'package:travel_booking_tour/features/explore/blocs/bloc_explore_event.dart';
import 'package:travel_booking_tour/features/explore/blocs/bloc_explore_state.dart';
import 'package:travel_booking_tour/features/explore/repositories/explore_repository.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../common/enums/enums.dart';
import '../../../router/routes.dart';

class BlocExploreScreen extends Bloc<BlocExploreEvent, BlocExploreState> {
  final ExploreRepository _exploreRepository = ExploreRepository();

  BlocExploreScreen() : super(BlocExploreStateInitial()) {
    on<BlocExploreEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(
      BlocExploreEvent event, Emitter<BlocExploreState> emit) async {
    if (event is BlocExploreEventInitial) {
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
    } else if (event is BlocExploreEventOnTourClick) {
      Routes.navigateTo(AppPath.tourDetail, {'data': event.tourDetailJson});
    } else if (event is BlocExploreEventOnBestGuideClick) {
      Routes.navigateTo(AppPath.guide, {'data': event.tourGuideDetailJson});
    } else if (event is BlocExploreEventOnSeeMoreClick) {
      Routes.navigateTo(AppPath.seeMore, {'data': event.seeMoreType});
    }
  }

  Future<TourGuideDetailJson> getTourGuideDetail(int id) async {
    return await _exploreRepository.getTourGuideDetail(id);
  }
}
