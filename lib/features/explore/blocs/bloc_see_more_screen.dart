import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/common/enums/enums.dart';
import 'package:travel_booking_tour/features/explore/blocs/bloc_see_more_event.dart';
import 'package:travel_booking_tour/features/explore/blocs/bloc_see_more_state.dart';
import 'package:travel_booking_tour/features/explore/repositories/explore_repository.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

class BlocSeeMoreScreen extends Bloc<BlocSeeMoreEvent, BlocSeeMoreState> {
  BlocSeeMoreScreen() : super(BlocSeeMoreStateInitial()) {
    on<BlocSeeMoreEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  final ExploreRepository _exploreRepository = ExploreRepository();

  void mapStateToEvent(
      BlocSeeMoreEvent event, Emitter<BlocSeeMoreState> emit) async {
    if (event is BlocSeeMoreEventInitial) {
      await Future.delayed(
        const Duration(seconds: 2),
        () async => loadData(event.seeMoreType, emit),
      );
    } else if (event is BlocSeeMoreEventLoadMore) {
      emit(BlocSeeMoreStateLoadingMore());
      await Future.delayed(
        const Duration(seconds: 5),
        () async => loadData(event.seeMoreType, emit),
      );
    } else if (event is BlocSeeMoreEventOnItemClick) {
      if (event.seeMoreType == SeeMoreType.guide) {
        Routes.navigateTo(AppPath.guide, {'data': event.data});
      } else if (event.seeMoreType == SeeMoreType.tour) {
        Routes.navigateTo(AppPath.tourDetail, {'data': event.data});
      } else if (event.seeMoreType == SeeMoreType.news) {}
    }
  }

  void loadData(SeeMoreType seeMoreType, Emitter<BlocSeeMoreState> emit) async {
    if (seeMoreType == SeeMoreType.guide) {
      final data = await _exploreRepository.getListTourGuide();
      emit(BlocSeeMoreStateLoadingMoreSuccess(data: data));
      emit(BlocSeeMoreStateLoadingDone());
    } else if (seeMoreType == SeeMoreType.tour) {
      final data = await _exploreRepository.getListTopJourney();
      emit(BlocSeeMoreStateLoadingMoreSuccess(data: data));
      emit(BlocSeeMoreStateLoadingDone());
    } else if (seeMoreType == SeeMoreType.news) {
      final data = await _exploreRepository.getListTopJourney();
      emit(BlocSeeMoreStateLoadingMoreSuccess(data: data));
      emit(BlocSeeMoreStateLoadingDone());
    }
  }
}
