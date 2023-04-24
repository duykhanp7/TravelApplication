import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_state.dart';
import 'package:travel_booking_tour/features/explore/repository/explore_repository.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../common/app_constant.dart';
import '../../../common/enum/enums.dart';
import '../../../data/model/tour_detail_json.dart';
import '../../../data/model/tour_guide_detail_json.dart';
import '../../../router/routes.dart';

class BlocExploreScreen extends Bloc<BlocExploreEvent, BlocExploreState> {
  final ExploreRepository _exploreRepository = ExploreRepository();

  BlocExploreScreen() : super(BlocExploreStateInitial()) {
    on<BlocExploreEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(
      BlocExploreEvent event, Emitter<BlocExploreState> emit) async {
    if (event is BlocExploreEventInitial) {
      try {
        emit(BlocExploreStateLoadData(
            appResult: AppResult(state: ResultState.loading)));

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

        Map<TypeDestination, List<dynamic>> mapData = {
          TypeDestination.featureTourJson: featuresTourJsons,
          TypeDestination.bestGuideJson: bestGuideJsons,
          TypeDestination.topExperienceJson: topExperienceJsons,
          TypeDestination.topJourneyJson: topJourneyJsons,
          TypeDestination.travelNewJson: travelNewJsons,
        };

        emit(BlocExploreStateLoadData(
            appResult: AppResult(state: ResultState.success, result: mapData)));
      } on NetworkException catch (e) {
        emit(BlocExploreStateLoadData(
            appResult: AppResult(state: ResultState.fail)));
        debugPrint('NetworkException : ${e.getTextError}');
      }
    } else if (event is BlocExploreEventOnTourClick) {
      Routes.navigateTo(
          AppPath.tourDetail, {AppConstant.data: event.tourDetailJson});
    } else if (event is BlocExploreEventOnBestGuideClick) {
      Routes.navigateTo(
          AppPath.guide, {AppConstant.data: event.tourGuideDetailJson});
    } else if (event is BlocExploreEventOnSeeMoreClick) {
      Routes.navigateTo(AppPath.seeMore, {AppConstant.data: event.seeMoreType});
    }
  }

  Future<TourGuideDetailJson> getTourGuideDetail(int id) async {
    return await _exploreRepository.getTourGuideDetail(id);
  }
}
