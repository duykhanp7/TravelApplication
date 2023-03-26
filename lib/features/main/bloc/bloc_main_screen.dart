import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_event.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

class BlocMainScreen extends Bloc<BlocMainEvent, BlocMainState> {
  int index = 0;
  BlocMainScreen() : super(BlocMainStateInitial()) {
    on<BlocMainEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(BlocMainEvent event, Emitter<BlocMainState> emit) async {
    if (event is BlocMainEventInitial) {
      index = 0;
      emit(BlocMainStateChangeTabIndex(index: 0));
    } else if (event is BlocMainEventChangeTabIndex) {
      index = event.index;
      emit(BlocMainStateChangeTabIndex(index: event.index));
    } else if (event is BlocMainEventSearchSystemClick) {
      Routes.navigateTo(AppPath.searchSystem, {});
    }
  }
}
