import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/profile/bloc/bloc_profile_screen.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../bloc/bloc_profile_event.dart';

class MyPhotosScreen extends StatefulWidget {
  const MyPhotosScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyPhotosScreen();
  }
}

class _MyPhotosScreen extends State<MyPhotosScreen> {
  late BlocProfileScreen _blocProfileScreen;

  @override
  void initState() {
    _blocProfileScreen = BlocProvider.of<BlocProfileScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarApp(title: 'My Photos'),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.only(top: 24),
              alignment: Alignment.topLeft,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 123,
                    height: 123,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.primary)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppIcons.icAddBlue),
                        const SizedBox(height: 8),
                        Text(
                          'Add Photos',
                          style: AppStyles.titleSmall
                              .copyWith(color: AppColors.primary),
                        )
                      ],
                    ),
                  ),
                  Material(
                    color: AppColors.transparent,
                    child: InkWell(
                      onTap: () => _blocProfileScreen
                          .add(BlocProfileEventAddMoreMyPhotos()),
                      child: Container(
                        color: AppColors.transparent,
                        width: 123,
                        height: 123,
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
