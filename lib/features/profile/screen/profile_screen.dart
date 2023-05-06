import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_photos/bloc_my_photos_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_state.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';
import 'package:travel_booking_tour/features/profile/widget/photo_item.dart';
import 'package:travel_booking_tour/res/res.dart';
import '../../guide/detail/widget/my_experience_item.dart';
import '../bloc/my_journeys/bloc_my_journeys_screen.dart';
import '../bloc/my_journeys/bloc_my_journeys_state.dart';
import '../bloc/my_photos/bloc_my_photos_screen.dart';
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
    return LayoutBuilder(
      builder: (context, constraint) => RefreshIndicator(
        onRefresh: () async {
          if (!_blocProfileScreen.isLoading) {
            _blocProfileScreen.isActionRefresh = true;
            _blocProfileScreen.add(BlocProfileEventInitial());
            _blocMyJourneysScreen.add(BlocMyJourneysEventInitial());
          }
          return;
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 24, top: 28),
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
                  BlocBuilder<BlocProfileScreen, BlocProfileState>(
                      buildWhen: (previous, current) =>
                          current is BlocProfileStateLoadUserInforResult,
                      builder: (context, state) {
                        List<PhotoJson> photos = [
                          ..._blocProfileScreen.userInfoJson?.images ?? []
                        ];
                        if (state is BlocProfileStateLoadUserInforResult) {
                          if (state.appResult.state == ResultState.success) {
                            photos = (state.appResult.result as UserInfoJson)
                                    .images ??
                                [];
                          } else if (state.appResult.state ==
                              ResultState.loading) {
                            return SizedBox(
                              height: 300,
                              child: AppLayoutShimmer(
                                background:
                                    AppColors.textHintColor.withOpacity(0.2),
                              ),
                            );
                          }
                        }
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
                                itemCount:
                                    photos.length >= 4 ? 3 : photos.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => PhotoItem(
                                    url: photos[index].url ??
                                        photos[index].uploadUrl ??
                                        '',
                                    selected: false,
                                    isHttps: true,
                                    enable: false,
                                    visibilityRadioButton: false)),
                          ),
                          const SizedBox(height: 3),
                          photos.length >= 4
                              ? Container(
                                  width: double.infinity,
                                  height: 186,
                                  alignment: Alignment.center,
                                  child: PhotoItem(
                                    url: photos[3].url ??
                                        photos[3].uploadUrl ??
                                        '',
                                    selected: false,
                                    isHttps: true,
                                    enable: false,
                                  ),
                                )
                              : Container(),
                        ]);
                      }),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, top: 24, right: 24),
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
                          onTap: () => {
                            _blocProfileScreen
                                .add(BlocProfileEventShowMyJourneys()),
                          },
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<BlocMyJourneysScreen, BlocMyJourneysState>(
                      buildWhen: (previous, current) =>
                          current is BlocMyJourneysStateAddJourney ||
                          current is BlocMyJourneysStateLoadJourneys,
                      builder: (context, state) {
                        if (state is BlocMyJourneysStateLoadJourneys) {
                          if (state.appResult.state == ResultState.loading) {
                            return SizedBox(
                              height: 300,
                              child: AppLayoutShimmer(
                                background:
                                    AppColors.textHintColor.withOpacity(0.2),
                              ),
                            );
                          }
                        }
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 17, bottom: 20),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _blocMyJourneysScreen
                                      .listMyExperienceJson.length >=
                                  2
                              ? 2
                              : _blocMyJourneysScreen
                                  .listMyExperienceJson.length,
                          itemBuilder: (context, index) => MyExperienceItem(
                              myExperienceJson: _blocMyJourneysScreen
                                  .listMyExperienceJson[index],
                              edited: true),
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
