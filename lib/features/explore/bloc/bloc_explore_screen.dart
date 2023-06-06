import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/data/model/user_experiences_json.dart';
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
import 'package:travel_booking_tour/common/extension/context_extension.dart';

class BlocExploreScreen extends Bloc<BlocExploreEvent, BlocExploreState> {
  final ExploreRepository _exploreRepository = ExploreRepository();

  BlocExploreScreen() : super(BlocExploreStateInitial()) {
    on<BlocExploreEvent>(mapStateToEvent, transformer: restartable());
  }

  List<TourDetailJson> topJourneyJsons = [];
  List<TourGuideDetailJson> bestGuideJsons = [];
  List<UserExperienceJson> topExperienceJsons = [];
  List<TourDetailJson> featuresTourJsons = [];
  List<NewsJson> travelNewJsons = [];

  void mapStateToEvent(
      BlocExploreEvent event, Emitter<BlocExploreState> emit) async {
    if (event is BlocExploreEventInitial) {
      try {
        if (topExperienceJsons.isEmpty ||
            bestGuideJsons.isEmpty ||
            topExperienceJsons.isEmpty ||
            featuresTourJsons.isEmpty ||
            travelNewJsons.isEmpty) {
          emit(BlocExploreStateLoadData(
              appResult: AppResult(state: ResultState.loading)));
        }

        await Future.forEach(event.objects!, (element) async {
          if (element == TypeDestination.featureTourJson) {
            featuresTourJsons =
                await _exploreRepository.getListTopJourneyLocal();
          } else if (element == TypeDestination.bestGuideJson) {
            bestGuideJsons = await _exploreRepository.getListTourGuide(1);
          } else if (element == TypeDestination.topExperienceJson) {
            topExperienceJsons =
                await _exploreRepository.getListUserExperiences();
          } else if (element == TypeDestination.topJourneyJson) {
            topJourneyJsons = await _exploreRepository.getListTopJourneyLocal();
          } else if (element == TypeDestination.travelNewJson) {
            travelNewJsons = await _exploreRepository.getListNews(1);
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
    } else if (event is BlocExploreEventOnNewsClick) {
      emit(BlocExploreStateLoadDetailNewsData(
          appResult: AppResult(state: ResultState.loading)));
      if (!event.isShow) {
        await event.context.showBottomSheetNews(event.newsJson);
      } else {
        NewsJson? newJson =
            await _exploreRepository.getDetailNews(event.newsJson.id);
        emit(BlocExploreStateLoadDetailNewsData(
            appResult: AppResult(state: ResultState.success, result: newJson)));
      }
    } else if (event is BlocExploreEventLoadDetailNews) {
      NewsJson? newJson =
          await _exploreRepository.getDetailNews(event.newsJson.id);
      emit(BlocExploreStateLoadDetailNewsData(
          appResult: AppResult(state: ResultState.success, result: newJson)));
    }
  }

  Future<String?> getTourGuideDetail(int id) async =>
      _exploreRepository.getDetailUserExperiences(id);
}
