import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/features/my_trip/bloc/bloc_my_trips_event.dart';
import 'package:travel_booking_tour/features/my_trip/bloc/bloc_my_trips_screen.dart';
import 'package:travel_booking_tour/features/my_trip/bloc/bloc_my_trips_state.dart';
import 'package:travel_booking_tour/features/my_trip/model/booking_trip_json.dart';
import 'package:travel_booking_tour/features/my_trip/widget/booking_trip_item.dart';
import 'package:travel_booking_tour/res/app_layout_shimmer.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../../common/enum/enums.dart';

class CurrentTripsScreen extends StatefulWidget {
  const CurrentTripsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CurrentTripsScreen();
  }
}

class _CurrentTripsScreen extends State<CurrentTripsScreen> {
  late BlocMyTripScreen _blocMyTripScreen;

  @override
  void initState() {
    _blocMyTripScreen = BlocProvider.of<BlocMyTripScreen>(context);
    _blocMyTripScreen
        .add(BlocMyTripEventInitial(tabMyList: TabMyList.currentTrips));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BlocMyTripScreen, BlocMyTripState>(
      buildWhen: (previous, current) =>
          current is BlocMyTripStateLoadCurrentTrips,
      builder: (context, state) {
        if (state is BlocMyTripStateLoadCurrentTrips) {
          if (state.appResult.state == ResultState.fail) {
            return Container(
              alignment: Alignment.center,
              child: const Text(
                'Loading fail',
                style: TextStyle(fontSize: 20, color: AppColors.black),
              ),
            );
          } else if (state.appResult.state == ResultState.success) {
            final List<BookingTripJson> items =
                state.appResult.result as List<BookingTripJson>;
            return ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.only(
                  bottom: 30, top: 10, left: 16, right: 16),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => BookingTripItem(
                  callback: () {}, bookingTripJson: items[index]),
            );
          }
        }
        return const AppLayoutShimmer();
      },
    );
  }
}
