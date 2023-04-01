import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../../common/enums/enums.dart';
import '../../../res/app_layout_shimmer.dart';
import '../bloc/bloc_my_trips_event.dart';
import '../bloc/bloc_my_trips_screen.dart';
import '../bloc/bloc_my_trips_state.dart';
import '../model/booking_trip_json.dart';
import '../widget/booking_trip_item.dart';

class PastTripsScreen extends StatefulWidget {
  const PastTripsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PastTripsScreen();
  }
}

class _PastTripsScreen extends State<PastTripsScreen> {
  late BlocMyTripScreen _blocMyTripScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: _buildBody(),
    );
  }

  @override
  void initState() {
    _blocMyTripScreen = BlocProvider.of<BlocMyTripScreen>(context);
    _blocMyTripScreen
        .add(BlocMyTripEventInitial(tabMyList: TabMyList.pastTrips));
    super.initState();
  }

  Widget _buildBody() {
    return BlocBuilder<BlocMyTripScreen, BlocMyTripState>(
      buildWhen: (previous, current) => current is BlocMyTripStateLoadPastTrips,
      builder: (context, state) {
        if (state is BlocMyTripStateLoadPastTrips) {
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
