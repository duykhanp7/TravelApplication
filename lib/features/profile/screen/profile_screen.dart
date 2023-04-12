import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/profile/bloc/bloc_profile_event.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../bloc/bloc_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreen();
  }
}

class _ProfileScreen extends State<ProfileScreen> {
  late BlocProfileScreen _blocProfileScreen;

  @override
  void initState() {
    _blocProfileScreen = BlocProvider.of<BlocProfileScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16, top: 28, right: 24),
              child: Row(
                children: [
                  Text(
                    'My Photos',
                    style: AppStyles.titleLarge.copyWith(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w100),
                  ),
                  const Spacer(),
                  InkWell(
                    child: SvgPicture.asset(AppIcons.icMoreNext),
                    onTap: () => _blocProfileScreen
                        .add(BlocProfileEventShowMoreMyPhotos()),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.only(left: 16, top: 28, right: 24),
              child: Row(
                children: [
                  Text(
                    'My Journeys',
                    style: AppStyles.titleLarge.copyWith(
                        fontSize: 24,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w100),
                  ),
                  const Spacer(),
                  InkWell(
                    child: SvgPicture.asset(AppIcons.icMoreNext),
                    onTap: () => _blocProfileScreen
                        .add(BlocProfileEventShowMyJourneys()),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
