import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/my_trip/bloc/bloc_my_trips_screen.dart';
import 'package:travel_booking_tour/features/my_trip/screen/current_trips_screen.dart';
import 'package:travel_booking_tour/features/my_trip/screen/next_trips.screen.dart';
import 'package:travel_booking_tour/features/my_trip/screen/past_trips_screen.dart';
import 'package:travel_booking_tour/features/my_trip/screen/wish_list_screen.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../common/app_constant.dart';
import '../../../common/enum/enums.dart';
import '../../../router/routes.dart';

class MyTripScreen extends StatefulWidget {
  const MyTripScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _MyTripScreen();
  }
}

class _MyTripScreen extends State<MyTripScreen> with TickerProviderStateMixin {
  late BlocMyTripScreen _blocMyTripScreen;
  final CurrentTripsScreen _currentTripsScreen = const CurrentTripsScreen();
  final NextTripsScreen _nextTripsScreen = const NextTripsScreen();
  final PastTripsScreen _pastTripsScreen = const PastTripsScreen();
  final WishListTripsScreen _wishListTripsScreen = const WishListTripsScreen();
  late List<Widget> widgets;
  late TabController _tabController;

  @override
  void initState() {
    _blocMyTripScreen = BlocProvider.of<BlocMyTripScreen>(context);

    widgets = <Widget>[];
    widgets.add(_currentTripsScreen);
    widgets.add(_nextTripsScreen);
    widgets.add(_pastTripsScreen);
    widgets.add(_wishListTripsScreen);

    _tabController = TabController(
        initialIndex: _blocMyTripScreen.currentTabIndex,
        length: 4,
        vsync: this);

    _blocMyTripScreen.setTabController(_tabController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(child: _buildBody()),
      floatingActionButton: _buildFloatingButton(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: AppColors.talkBgColor,
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: widgets,
      ),
    );
  }

  Widget _buildFloatingButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primary),
        ),
        SvgPicture.asset(AppIcons.icAddBlue,
            color: AppColors.white, width: 24, height: 24),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.transparent),
          child: Material(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              splashColor: AppColors.white.withOpacity(0.2),
              highlightColor: AppColors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                //Floating button
                Routes.navigateTo(AppPath.editTripInformation, {
                  AppConstant.tripInformationMode:
                      EditTripInformationMode.createNewTrip
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
