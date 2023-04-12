import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/profile/bloc/bloc_profile_screen.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/router/routes.dart';

import '../bloc/bloc_profile_event.dart';

class MyJourneysScreen extends StatefulWidget {
  const MyJourneysScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyJourneysScreen();
  }
}

class _MyJourneysScreen extends State<MyJourneysScreen> {
  late BlocProfileScreen _blocProfileScreen;

  @override
  void initState() {
    _blocProfileScreen = BlocProvider.of<BlocProfileScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarApp(
        title: 'My Journeys',
        prefixWidget: AppInkWell(
          voidCallBack: Routes.backTo,
          icon: AppIcons.icBack,
          iconSize: Size(12, 20),
          background: AppColors.transparent,
          iconTint: AppColors.black,
        ),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 32),
        child: Column(
          children: [
            PrimaryActiveButton(
              text: 'Add Journey',
              onTap: () =>
                  _blocProfileScreen.add(BlocProfileEventAddMoreMyJourneys()),
              borderRadius: BorderRadius.circular(8),
              height: 40,
              icon: Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: SvgPicture.asset(AppIcons.icAddBlue,
                      width: 20, height: 20)),
              textStyle:
                  AppStyles.titleSmall.copyWith(color: AppColors.primary),
              margin: EdgeInsets.zero,
              allCaps: false,
              ripple: AppColors.black.withOpacity(0.1),
              border: Border.all(width: 1, color: AppColors.primary),
              color: AppColors.white,
            )
          ],
        ),
      )),
    );
  }
}
