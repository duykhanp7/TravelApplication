import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_booking_tour/common/app_logger.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_state.dart';
import 'package:travel_booking_tour/features/explore/repository/explore_repository.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

import '../../../common/enum/enums.dart';

class BlocSeeMoreScreen extends Bloc<BlocSeeMoreEvent, BlocSeeMoreState> {
  BlocSeeMoreScreen() : super(BlocSeeMoreStateInitial()) {
    on<BlocSeeMoreEvent>(mapStateToEvent, transformer: restartable());
  }

  final ExploreRepository _exploreRepository = ExploreRepository();
  List<dynamic> mainData = [];
  bool isLoading = false;
  late SeeMoreType? seeMoreType;
  final ScrollController scrollController = ScrollController();
  int currentPage = 1;

  void mapStateToEvent(
      BlocSeeMoreEvent event, Emitter<BlocSeeMoreState> emit) async {
    if (event is BlocSeeMoreEventInitial) {
      currentPage = 1;
      mainData.clear();
      await loadData(event.seeMoreType, emit, false);
    } else if (event is BlocSeeMoreEventLoadMore) {
      emit(BlocSeeMoreStateLoadData(
          appResult: AppResult(state: ResultState.loadingMore)));
      await Future.delayed(
        const Duration(seconds: 5),
        () async => await loadData(event.seeMoreType, emit, true),
      );
    } else if (event is BlocSeeMoreEventOnItemClick) {
      if (event.seeMoreType == SeeMoreType.guide) {
        Routes.navigateTo(AppPath.guide, {'data': event.data});
      } else if (event.seeMoreType == SeeMoreType.tour) {
        Routes.navigateTo(AppPath.tourDetail, {'data': event.data});
      } else if (event.seeMoreType == SeeMoreType.news) {}
    }
  }

  Future<void> loadData(SeeMoreType seeMoreType, Emitter<BlocSeeMoreState> emit,
      bool isLoadMore) async {
    try {
      if (isLoadMore) {
        currentPage = currentPage + 1;
      } else {
        emit(BlocSeeMoreStateLoadData(
            appResult: AppResult(state: ResultState.loading)));
      }

      if (seeMoreType == SeeMoreType.guide) {
        final data = await _exploreRepository.getListTourGuide(currentPage);
        emit(BlocSeeMoreStateLoadData(
            appResult: AppResult(
                state:
                    isLoadMore ? ResultState.loadingMore : ResultState.success,
                result: data)));
      } else if (seeMoreType == SeeMoreType.tour) {
        final data = await _exploreRepository.getListTopJourney();
        emit(BlocSeeMoreStateLoadData(
            appResult: AppResult(
                state:
                    isLoadMore ? ResultState.loadingMore : ResultState.success,
                result: data)));
      } else if (seeMoreType == SeeMoreType.news) {
        final data = await _exploreRepository.getListNews(currentPage);
        emit(BlocSeeMoreStateLoadData(
            appResult: AppResult(
                state:
                    isLoadMore ? ResultState.loadingMore : ResultState.success,
                result: data)));
      }
      emit(BlocSeeMoreStateClose());
    } on NetworkException catch (e) {
      emit(BlocSeeMoreStateLoadData(
          appResult: AppResult(state: ResultState.fail)));
      emit(BlocSeeMoreStateClose());
      AppLogger.loggerOnNetworkException(e);
    }
  }
}
