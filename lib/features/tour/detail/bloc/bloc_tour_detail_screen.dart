import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/data/model/tour_detail_json.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_event.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_state.dart';
import 'package:travel_booking_tour/features/tour/detail/repository/tour_detail_repository.dart';

class BlocTourDetailScreen
    extends Bloc<BlocTourDetailEvent, BlocTourDetailState> {
  final TourDetailRepository _tourDetailRepository = TourDetailRepository();
  late List<String> images;
  bool isLoading = false;

  BlocTourDetailScreen() : super(BlocTourDetailStateInitial()) {
    on<BlocTourDetailEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(
      BlocTourDetailEvent event, Emitter<BlocTourDetailState> emit) async {
    if (event is BlocTourDetailEventInitial) {
      isLoading = false;
      if (!isLoading) {
        try {
          isLoading = true;
          emit(BlocTourDetailStateLoading(
              appResult: AppResult(state: ResultState.loading)));
          emit(BlocTourDetailStateChangeIndexSchedule(index: 0));
          await Future.delayed(const Duration(seconds: 2), () {});
          final datas = await _tourDetailRepository.getTourDetail();
          if (datas != null) {
            images = datas;
            isLoading = false;
            emit(BlocTourDetailStateLoading(
                appResult: AppResult(state: ResultState.success)));

            emit(BlocTourDetailStateChangeIndexImageSlider(index: 0));
          } else {
            isLoading = false;
            emit(BlocTourDetailStateLoading(
                appResult: AppResult(state: ResultState.fail)));
          }
        } on NetworkException catch (e) {
          isLoading = false;
          debugPrint('BlocTourDetailScreen NetworkException : ${e.toString()}');
        }
      }
    } else if (event is BlocTourDetailEventChangeIndexSchedule) {
      emit(BlocTourDetailStateChangeIndexSchedule(index: event.index));
    } else if (event is BlocTourDetailEventChangeIndexImageSlider) {
      emit(BlocTourDetailStateChangeIndexImageSlider(index: event.index));
    } else if (event is BlocTourDetailEventShowBottomSheetShare) {
      emit(BlocTourDetailStateShowBottomSheetShare(
          current: DateTime.now().millisecond));
    } else if (event is BlocTourDetailEventClickButtonBookThisTour) {
      emit(BlocTourDetailStateBookThisTourResult(
          appResult: AppResult(state: ResultState.loading)));

      TourDetailJson tourDetailJson = event.tourDetailJson;

      await Future.delayed(const Duration(seconds: 2), () async {
        final dynamic data = await _tourDetailRepository.bookingTour(
            tourDetailJson.id, tourDetailJson.price.toString(), 15);
        if (data != null) {
          emit(BlocTourDetailStateBookThisTourResult(
              appResult: AppResult(state: ResultState.success, result: data)));
        } else {
          emit(BlocTourDetailStateBookThisTourResult(
              appResult: AppResult(state: ResultState.fail)));
        }
      });
    }
  }
}
