import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_event.dart';
import 'package:travel_booking_tour/features/profile/widget/photo_item.dart';
import 'package:travel_booking_tour/res/res.dart';
import '../../guide/detail/widget/my_experience_item.dart';
import '../bloc/my_journeys/bloc_my_journeys_screen.dart';
import '../bloc/my_journeys/bloc_my_journeys_state.dart';
import '../bloc/my_photos/bloc_my_photos_screen.dart';
import '../bloc/my_photos/bloc_my_photos_state.dart';
import '../bloc/profile/bloc_profile_event.dart';
import '../bloc/profile/bloc_profile_screen.dart';

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
  late BlocMyPhotosScreen _blocMyPhotosScreen;
  late BlocMyJourneysScreen _blocMyJourneysScreen;

  @override
  void initState() {
    _blocProfileScreen = BlocProvider.of<BlocProfileScreen>(context);
    _blocProfileScreen.add(BlocProfileEventInitial());
    _blocMyPhotosScreen = BlocProvider.of<BlocMyPhotosScreen>(context);
    _blocMyJourneysScreen = BlocProvider.of<BlocMyJourneysScreen>(context);
    _blocMyPhotosScreen.add(BlocMyPhotosEventInitial());
    _blocMyJourneysScreen.add(BlocMyJourneysEventInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppColors.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 24),
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
              const SizedBox(height: 17),
              BlocBuilder<BlocMyPhotosScreen, BlocMyPhotosState>(
                  buildWhen: (previous, current) =>
                      current is BlocMyPhotosStateAddNewPhotos,
                  builder: (context, state) {
                    List<String> photos = [..._blocMyPhotosScreen.myPhotos];
                    photos.removeWhere((element) => element.isEmpty);

                    return Column(children: [
                      SizedBox(
                        height: photos.isNotEmpty ? 123 : 0,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1 / 1,
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 3,
                                    crossAxisSpacing: 3),
                            shrinkWrap: false,
                            itemCount: photos.length >= 4 ? 3 : photos.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => PhotoItem(
                                file: File(photos[index]),
                                selected: false,
                                enable: false,
                                onClick: (p0, p1) {})),
                      ),
                      const SizedBox(height: 3),
                      photos.length >= 4
                          ? Container(
                              width: double.infinity,
                              height: 186,
                              alignment: Alignment.center,
                              child: PhotoItem(
                                file: File(photos[3]),
                                selected: false,
                                onClick: (p0, p1) {},
                                enable: false,
                              ),
                            )
                          : Container(),
                    ]);
                  }),
              Container(
                padding: const EdgeInsets.only(left: 16, top: 24, right: 24),
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
              ),
              BlocBuilder<BlocMyJourneysScreen, BlocMyJourneysState>(
                  buildWhen: (previous, current) =>
                      current is BlocMyJourneysStateAddJourney,
                  builder: (context, state) => ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 17, bottom: 20),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _blocMyJourneysScreen
                                    .listMyExperienceJson.length >=
                                2
                            ? 2
                            : _blocMyJourneysScreen.listMyExperienceJson.length,
                        itemBuilder: (context, index) => MyExperienceItem(
                            myExperienceJson: _blocMyJourneysScreen
                                .listMyExperienceJson[index],
                            edited: true),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
