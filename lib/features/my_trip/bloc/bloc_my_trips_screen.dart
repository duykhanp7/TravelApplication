import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/features/my_trip/bloc/bloc_my_trips_event.dart';
import 'package:travel_booking_tour/features/my_trip/bloc/bloc_my_trips_state.dart';
import 'package:travel_booking_tour/features/my_trip/repository/my_trip_repository.dart';

import '../../../common/enum/enums.dart';
import '../model/booking_trip_json.dart';

class BlocMyTripScreen extends Bloc<BlocMyTripEvent, BlocMyTripState> {
  late TabController _tabController;
  int currentTabIndex = 0;
  final MyTripRepository _myTripRepository = MyTripRepository();

  BlocMyTripScreen() : super(BlocMyTripStateInitial()) {
    on<BlocMyTripEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(
      BlocMyTripEvent event, Emitter<BlocMyTripState> emit) async {
    if (event is BlocMyTripEventInitial) {
      //Load all type of booking trips
      if (event.tabMyList == TabMyList.currentTrips) {
        final List<BookingTripJson>? currentTrips =
            await _myTripRepository.getListBooking();
        emit(BlocMyTripStateLoadCurrentTrips(
          appResult: AppResult<List<BookingTripJson>>(
              state: ResultState.success, result: currentTrips),
        ));
      } else if (event.tabMyList == TabMyList.nextTrips) {
        final List<BookingTripJson>? nextTrips =
            await _myTripRepository.getListBooking();

        emit(BlocMyTripStateLoadNextTrips(
          appResult: AppResult<List<BookingTripJson>>(
              state: ResultState.success, result: nextTrips),
        ));
      } else if (event.tabMyList == TabMyList.pastTrips) {
        final List<BookingTripJson>? pastTrips =
            await _myTripRepository.getListBooking();
        emit(BlocMyTripStateLoadPastTrips(
          appResult: AppResult<List<BookingTripJson>>(
              state: ResultState.success, result: pastTrips),
        ));
      } else if (event.tabMyList == TabMyList.wishListTrips) {
        final List<BookingTripJson>? wishListTrips =
            await _myTripRepository.getListBooking();

        emit(BlocMyTripStateLoadWishListTrips(
          appResult: AppResult<List<BookingTripJson>>(
              state: ResultState.success, result: wishListTrips),
        ));
      }
    } else if (event is BlocMyTripEventChangeIndex) {
      emit(BlocMyTripStateChangeIndex(index: event.index));
      _tabController.animateTo(event.index);
      currentTabIndex = event.index;
    }
  }

  void setTabController(TabController tabController) {
    _tabController = tabController;
  }
}
