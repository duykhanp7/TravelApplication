import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/main/blocs/bloc_main_event.dart';
import 'package:travel_booking_tour/features/main/blocs/bloc_main_state.dart';

class BlocMainScreen extends Bloc<BlocmainEvent, BlocMainState> {
  int index = 0;
  BlocMainScreen() : super(BlocMainStateInitial()) {
    on<BlocmainEventInitial>((event, emit) {
      index = 0;
      emit(BlocMainStateChangeTabIndex(index: 0));
    });
    on<BlocmainEventChangeTabIndex>((event, emit) {
      index = event.index;
      emit(BlocMainStateChangeTabIndex(index: event.index));
    });
  }
}
