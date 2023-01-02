import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/bloc_event.dart';
import 'package:travel_booking_tour/bloc_state.dart';

class BlocTest extends Bloc<BlocTestEvent, BlocTestState> {
  BlocTest() : super(BlocTestStateInitial()) {
    on<BlocTestLoadDataEvent>((event, emit) {
      emit(BlocTestStateLoadSuccess());
    });
    on<BlocTestStopLoadDataEvent>((event, emit) {
      emit(BlocTestStateLoadFail());
    });
  }
}
