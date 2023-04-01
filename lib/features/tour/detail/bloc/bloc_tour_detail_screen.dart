import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_event.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_state.dart';
import 'package:travel_booking_tour/features/tour/detail/repository/tour_detail_repository.dart';

class BlocTourDetailScreen
    extends Bloc<BlocTourDetailEvent, BlocTourDetailState> {
  final TourDetailRepository _tourDetailRepository = TourDetailRepository();
  late List<String> images;

  BlocTourDetailScreen() : super(BlocTourDetailStateInitial()) {
    on<BlocTourDetailEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(
      BlocTourDetailEvent event, Emitter<BlocTourDetailState> emit) async {
    if (event is BlocTourDetailEventInitial) {
      emit(BlocTourDetailStateLoading());
      emit(BlocTourDetailStateChangeIndexSchedule(index: 0));
      await Future.delayed(const Duration(seconds: 2), () {});
      final datas = await _tourDetailRepository.getTourDetail();
      if (datas != null) {
        images = datas;
        emit(BlocTourDetailStateLoadingSuccess());
        emit(BlocTourDetailStateChangeIndexImageSlider(index: 0));
      } else {
        emit(BlocTourDetailStateLoadingFail());
      }
    } else if (event is BlocTourDetailEventChangeIndexSchedule) {
      emit(BlocTourDetailStateChangeIndexSchedule(index: event.index));
    } else if (event is BlocTourDetailEventChangeIndexImageSlider) {
      emit(BlocTourDetailStateChangeIndexImageSlider(index: event.index));
    } else if (event is BlocTourDetailEventShowBottomSheetShare) {
      emit(BlocTourDetailStateShowBottomSheetShare(
          current: DateTime.now().millisecond));
    }
  }
}
