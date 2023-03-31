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

class WishListTripsScreen extends StatefulWidget {
  const WishListTripsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WishListTripsScreen();
  }
}

class _WishListTripsScreen extends State<WishListTripsScreen> {
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
        .add(BlocMyTripEventInitial(tabMyList: TabMyList.wishListTrips));
    super.initState();
  }

  Widget _buildBody() {
    return BlocBuilder<BlocMyTripScreen, BlocMyTripState>(
      buildWhen: (previous, current) =>
          current is BlocMyTripStateLoadWishListTrips,
      builder: (context, state) {
        if (state is BlocMyTripStateLoadWishListTrips) {
          if (state.appResult.resultState == ResultState.fail) {
            return Container(
              alignment: Alignment.center,
              child: const Text(
                'Loading fail',
                style: TextStyle(fontSize: 20, color: AppColors.black),
              ),
            );
          } else if (state.appResult.resultState == ResultState.success) {
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
