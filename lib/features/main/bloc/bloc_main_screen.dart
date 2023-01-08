import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_event.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_state.dart';

class BlocMainScreen extends Bloc<BlocmainEvent, BlocMainState> {
  BlocMainScreen() : super(BlocMainStateInitial()) {
    on<BlocmainEventInitial>((event, emit) {
      debugPrint('BlocmainEventInitial');
      emit(BlocMainStateChangeTabIndex(index: 0));
    });
    on<BlocmainEventChangeTabIndex>((event, emit) {
      emit(BlocMainStateChangeTabIndex(index: event.index));
    });
  }
}
