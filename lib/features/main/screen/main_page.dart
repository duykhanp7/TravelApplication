import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/features/explore/screen/explore_screen.dart';
import 'package:travel_booking_tour/features/my_trip/screen/my_trips_screen.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_event.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_screen.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_state.dart';
import 'package:travel_booking_tour/features/message/chat_screen.dart';
import 'package:travel_booking_tour/features/notification/notification_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_screen.dart';
import 'package:travel_booking_tour/features/profile/bloc/profile/bloc_profile_state.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';
import 'package:travel_booking_tour/features/profile/screen/profile_screen.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/res/app_layout_shimmer.dart';
import 'package:travel_booking_tour/res/app_search.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../l10n/generated/l10n.dart';
import '../../../res/button.dart';
import '../../../res/colors.dart';
import '../../../res/icons.dart';
import '../../../res/images.dart';
import '../../../res/styles.dart';
import '../../../res/system.dart';
import '../../../router/routes.dart';
import '../../my_trip/bloc/bloc_my_trips_event.dart';
import '../../my_trip/bloc/bloc_my_trips_screen.dart';
import '../../my_trip/bloc/bloc_my_trips_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> with SingleTickerProviderStateMixin {
  late SLocalization localization;
  late List<String> icons;
  late List<String> titles;
  late List<Widget> widgets;

  final ScrollController _scrollControllerTabExplore = ScrollController();
  final ScrollController _scrollControllerTabMyTrip = ScrollController();
  final ScrollController _scrollControllerTabMessage = ScrollController();
  final ScrollController _scrollControllerTabNotification = ScrollController();
  final ScrollController _scrollControllerTabProfile = ScrollController();
  late TabController _tabController;
  late List<ScrollController> _scrollController;
  late BlocMainScreen _blocMainScreen;
  late BlocMyTripScreen _blocMyTripScreen;
  late BlocProfileScreen _blocProfileScreen;
  double heightAppBar = 170;

  @override
  void initState() {
    icons = <String>[];

    icons.add(AppIcons.compassNone);
    icons.add(AppIcons.locationNone);
    icons.add(AppIcons.messageNone);
    icons.add(AppIcons.notificationNone);
    icons.add(AppIcons.personalNone);

    titles = <String>[];
    titles.add('Explore');
    titles.add('My Trips');
    titles.add('Chat');
    titles.add('Notification');
    titles.add('Profile');

    widgets = <Widget>[];
    widgets.add(ExploreScreen(scrollController: _scrollControllerTabExplore));
    widgets.add(MyTripScreen(scrollController: _scrollControllerTabMyTrip));
    widgets.add(ChatScreen(scrollController: _scrollControllerTabMessage));
    widgets.add(
        NotificationScreen(scrollController: _scrollControllerTabNotification));
    widgets.add(ProfileScreen(scrollController: _scrollControllerTabProfile));

    _scrollController = <ScrollController>[];
    _scrollController.add(_scrollControllerTabExplore);
    _scrollController.add(_scrollControllerTabMyTrip);
    _scrollController.add(_scrollControllerTabMessage);
    _scrollController.add(_scrollControllerTabNotification);
    _scrollController.add(_scrollControllerTabProfile);

    _tabController = TabController(length: 5, vsync: this);

    _blocMainScreen = BlocProvider.of<BlocMainScreen>(context);
    _blocMyTripScreen = BlocProvider.of<BlocMyTripScreen>(context);
    _blocProfileScreen = BlocProvider.of<BlocProfileScreen>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _blocMainScreen.add(BlocMainEventInitial());
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildHeader(double.infinity),
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            _buildBody(),
          ],
        ),
      ),
      extendBody: false,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: widgets),
    );
  }

  PreferredSizeWidget _buildHeader(double width) {
    return PreferredSize(
        preferredSize: Size(width, 175),
        child: SizedBox(
          width: width,
          child: BlocBuilder<BlocMainScreen, BlocMainState>(
            builder: (context, blocMainState) {
              if (blocMainState is BlocMainStateChangeTabIndex) {
                return AppbarApp(
                  prefixWidget: Container(),
                  flexibleSpace: Container(
                    height: 205,
                    color: AppColors.transparent,
                    child: blocMainState.index == 0
                        ? _buildExploreHeader(context)
                        : blocMainState.index == 4
                            ? _buildProfileHeader(width, context)
                            : _buildTripChatNotificationHeader(
                                width, blocMainState, context),
                  ),
                );
              }
              return Container();
            },
          ),
        ));
  }

  Widget _buildBottomTabMessage() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: AppSearch(
        hintText: 'Search Chat',
        margin: const EdgeInsets.only(left: 16, right: 16),
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.chipBg, borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  Widget _buildBottomTabMyTrip() {
    debugPrint('_buildBottomTabMyTrip');

    int indexTab = 0;
    late List<String> menus = <String>[];
    menus.add('Current Trips');
    menus.add('Next Trips');
    menus.add('Past Trips');
    menus.add('Wish List');
    return Container(
      height: 45,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 5),
      margin: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<BlocMyTripScreen, BlocMyTripState>(
        buildWhen: (previous, current) => current is BlocMyTripStateChangeIndex,
        builder: (context, state) {
          if (state is BlocMyTripStateChangeIndex) {
            indexTab = state.index;
          }
          return ListView.builder(
            itemCount: 4,
            padding: const EdgeInsets.only(left: 16, right: 16),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => PrimaryActiveButton(
              text: menus[index],
              width: 95,
              height: 45,
              color: indexTab == index ? AppColors.primary : AppColors.white,
              margin: EdgeInsets.zero,
              ripple: indexTab == index
                  ? AppColors.primary
                  : AppColors.black.withOpacity(0.2),
              allCaps: false,
              textStyle: AppStyles.titleSmall.copyWith(
                  fontWeight: FontWeight.w400,
                  color: indexTab == index
                      ? AppColors.white
                      : AppColors.textSkipColor),
              onTap: () => _blocMyTripScreen
                  .add(BlocMyTripEventChangeIndex(index: index)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomTabPersonal() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          color: AppColors.transparent,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: AppColors.transparent,
                      height: 80,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: BlocBuilder<BlocProfileScreen, BlocProfileState>(
                            buildWhen: (previous, current) =>
                                current
                                    is BlocProfileStateLoadUserInforResult ||
                                current is BlocProfileStateUpdateAvatar,
                            builder: (context, state) {
                              if (state
                                  is BlocProfileStateLoadUserInforResult) {
                                if (state.appResult.state ==
                                    ResultState.loading) {
                                  return const AppLayoutShimmer(
                                    height: 80,
                                    visibilityLoading: false,
                                    width: 80,
                                    background: AppColors.textHintColor,
                                  );
                                } else if (state.appResult.state ==
                                    ResultState.fail) {
                                  return SvgPicture.asset(
                                    AppIcons.icUser,
                                    height: 80,
                                    width: 80,
                                  );
                                }
                              } else if (state
                                  is BlocProfileStateUpdateAvatar) {
                                if (state.appResult.state ==
                                    ResultState.loading) {
                                  return const AppLayoutShimmer(
                                    height: 80,
                                    visibilityLoading: true,
                                    width: 80,
                                    background: AppColors.textHintColor,
                                  );
                                } else if (state.appResult.state ==
                                    ResultState.fail) {
                                  return SvgPicture.asset(
                                    AppIcons.icUser,
                                    height: 80,
                                    width: 80,
                                  );
                                }
                              }

                              if (_blocProfileScreen.userInfoJson != null &&
                                  _blocProfileScreen.userInfoJson?.avatar !=
                                      null) {
                                return CachedNetworkImage(
                                  imageUrl: _blocProfileScreen
                                          .userInfoJson?.avatar?.url ??
                                      '',
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  height: 80,
                                  width: 80,
                                  fadeInCurve: Curves.linearToEaseOut,
                                  fadeOutCurve: Curves.bounceInOut,
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(AppIcons.icUser),
                                  placeholder: (context, url) =>
                                      AppLayoutShimmer(
                                    visibilityLoading: false,
                                    background: AppColors.textHintColor
                                        .withOpacity(0.2),
                                    height: 80,
                                    width: 80,
                                  ),
                                );
                              }
                              return SvgPicture.asset(
                                AppIcons.icUser,
                                height: 40,
                                width: 40,
                                fit: BoxFit.contain,
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    Container(
                      color: AppColors.transparent,
                      child: Material(
                          borderRadius: BorderRadius.circular(40),
                          color: AppColors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(40),
                            highlightColor: AppColors.white.withOpacity(0.1),
                            splashColor: AppColors.white.withOpacity(0.1),
                            child: const SizedBox(
                              height: 80,
                              width: 80,
                            ),
                            onTap: () {},
                          )),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(top: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        offset: const Offset(-2, 2),
                                        blurRadius: 5,
                                        color:
                                            AppColors.black.withOpacity(0.25)),
                                    BoxShadow(
                                        offset: const Offset(2, 2),
                                        blurRadius: 5,
                                        color:
                                            AppColors.black.withOpacity(0.25))
                                  ],
                                  color: AppColors.white),
                              child: Material(
                                  color: AppColors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    highlightColor:
                                        AppColors.primary.withOpacity(0.5),
                                    splashColor:
                                        AppColors.primary.withOpacity(0.5),
                                    child: SvgPicture.asset(
                                      AppIcons.camera,
                                      color: AppColors.primary,
                                      width: 14,
                                      height: 11,
                                    ),
                                    onTap: () async {},
                                  )),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(top: 15),
                              alignment: Alignment.center,
                              child: Material(
                                  color: AppColors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    highlightColor:
                                        AppColors.white.withOpacity(0.3),
                                    splashColor:
                                        AppColors.white.withOpacity(0.3),
                                    onTap: () async {
                                      try {
                                        XFile? avatarFile = await context
                                            .showCameraAndTakePhotos();

                                        if (avatarFile != null) {
                                          _blocProfileScreen.add(
                                              BlocProfileEventUpdateAvatar(
                                                  avatar: avatarFile));
                                        }
                                      } on Exception catch (ex) {
                                        debugPrint(
                                            'Exception : ${ex.toString()}');
                                      }
                                    },
                                  )),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 5,
            right: 16,
            child: Container(
              height: 40,
              width: 40,
              color: AppColors.transparent,
              child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: AppColors.white.withOpacity(0.1),
                    child: Container(
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        AppIcons.camera,
                      ),
                    ),
                    onTap: () async {
                      try {
                        final XFile? coverFile =
                            await context.showCameraAndTakePhotos();
                        if (coverFile != null) {
                          _blocProfileScreen.add(
                              BlocProfileEventUpdateCover(cover: coverFile));
                        }
                      } on Exception catch (ex) {
                        debugPrint('Exception : ${ex.toString()}');
                      }
                    },
                  )),
            )),
        Positioned(
            right: 16,
            bottom: 0,
            child: BlocBuilder<BlocProfileScreen, BlocProfileState>(
                buildWhen: (previous, current) =>
                    current is BlocProfileStateLoadUserInforResult,
                builder: (context, state) {
                  UserInfoJson? userInfoJson;
                  if (state is BlocProfileStateLoadUserInforResult) {
                    if (state.appResult.state == ResultState.success) {
                      userInfoJson = state.appResult.result as UserInfoJson?;
                    } else if (state.appResult.state == ResultState.loading) {
                      return SizedBox(
                        width: 150,
                        height: 45,
                        child: AppLayoutShimmer(
                          background: AppColors.textHintColor.withOpacity(0.2),
                          borderRadius: 5,
                          visibilityLoading: false,
                        ),
                      );
                    }
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${userInfoJson?.lastName ?? ''} ${userInfoJson?.firstName ?? ''}',
                        style: AppStyles.headlineLarge.copyWith(
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.italic,
                            color: AppColors.black),
                      ),
                      Text(
                        userInfoJson?.email ?? '',
                        style: AppStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textHintColor),
                      )
                    ],
                  );
                })),
      ],
    );
  }

  Widget _buildBottomTabExplore() {
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      child: Hero(
        tag: AppConstant.heroSearchView,
        child: Material(
          type: MaterialType.transparency,
          child: AppSearch(
            readOnly: true,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppColors.textSkipColor.withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 8,
                      spreadRadius: 1)
                ]),
            margin: const EdgeInsets.only(left: 16, right: 16),
            enable: false,
            hintText: localization.hi_where_do_u_want_to_explore,
          ),
        ),
      ),
      onTap: () {
        _blocMainScreen.add(BlocMainEventSearchSystemClick());
      },
    );
  }

  SizedBox _buildTripChatNotificationHeader(double width,
      BlocMainStateChangeTabIndex blocMainState, BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.bgHeaderXplore,
              fit: BoxFit.cover,
              height: 156,
            ),
          ),
          SizedBox(
            width: width,
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  right: 0,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.only(
                        right: 16,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.blackDefault.withOpacity(0.1)),
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        color: AppColors.transparent,
                        child: Material(
                            color: AppColors.transparent,
                            borderRadius: BorderRadius.circular(25),
                            child: InkWell(
                              highlightColor: AppColors.white.withOpacity(0.1),
                              splashColor: AppColors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  AppIcons.search,
                                  width: 14,
                                  height: 14,
                                  color: AppColors.white,
                                ),
                              ),
                              onTap: () {},
                            )),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 60,
                    left: 1,
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, bottom: 20),
                      child: Text(titles[blocMainState.index],
                          style: AppStyles.titleLarge.copyWith(
                              fontSize: 34,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              color: AppColors.white)),
                    )),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: blocMainState.index == 1
                  ? _buildBottomTabMyTrip()
                  : blocMainState.index == 2
                      ? _buildBottomTabMessage()
                      : Container())
        ],
      ),
    );
  }

  Container _buildProfileHeader(double width, BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                SizedBox(
                    width: width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: width,
                          child:
                              BlocBuilder<BlocProfileScreen, BlocProfileState>(
                            buildWhen: (previous, current) =>
                                current
                                    is BlocProfileStateLoadUserInforResult ||
                                current is BlocProfileStateUpdateCover,
                            builder: (context, state) {
                              if (state
                                  is BlocProfileStateLoadUserInforResult) {
                                if (state.appResult.state ==
                                    ResultState.loading) {
                                  return SizedBox(
                                    height: 156,
                                    child: AppLayoutShimmer(
                                        visibilityLoading: false,
                                        background:
                                            AppColors.black.withOpacity(0.2)),
                                  );
                                } else if (state.appResult.state ==
                                    ResultState.fail) {
                                  return Image.asset(
                                    AppImages.defaultBg,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    height: 156,
                                  );
                                }
                              } else if (state is BlocProfileStateUpdateCover) {
                                if (state.appResult.state ==
                                    ResultState.loading) {
                                  return SizedBox(
                                    height: 156,
                                    child: AppLayoutShimmer(
                                        visibilityLoading: true,
                                        background:
                                            AppColors.black.withOpacity(0.2)),
                                  );
                                } else if (state.appResult.state ==
                                    ResultState.fail) {
                                  return Image.asset(
                                    AppImages.defaultBg,
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    height: 156,
                                  );
                                }
                              }

                              if (_blocProfileScreen.userInfoJson != null &&
                                  _blocProfileScreen.userInfoJson?.cover !=
                                      null) {
                                return CachedNetworkImage(
                                  imageUrl: _blocProfileScreen
                                          .userInfoJson?.cover?.url ??
                                      '',
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover,
                                  height: 156,
                                  fadeInCurve: Curves.linearToEaseOut,
                                  fadeOutCurve: Curves.bounceInOut,
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(AppIcons.icUser),
                                  placeholder: (context, url) =>
                                      AppLayoutShimmer(
                                          height: 156,
                                          visibilityLoading: false,
                                          background:
                                              AppColors.black.withOpacity(0.2)),
                                );
                              }
                              return Image.asset(
                                AppImages.defaultBg,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                height: 156,
                              );
                            },
                          ),
                        ),
                        Positioned(
                            top: 50,
                            right: 16,
                            child: Container(
                              height: 40,
                              width: 40,
                              color: AppColors.transparent,
                              child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    splashColor:
                                        AppColors.white.withOpacity(0.1),
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                        AppIcons.setting,
                                      ),
                                    ),
                                    onTap: () => Routes.navigateTo(
                                        AppPath.settings, {
                                      AppConstant.data:
                                          _blocProfileScreen.userInfoJson
                                    }),
                                  )),
                            )),
                      ],
                    )),
              ],
            ),
          ),
          Positioned(
              left: 0, right: 0, bottom: 0, child: _buildBottomTabPersonal())
        ],
      ),
    );
  }

  Container _buildExploreHeader(BuildContext context) {
    return Container(
      color: AppColors.transparent,
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: CachedNetworkImage(
              imageUrl: _blocMainScreen.unSplashURL?.raw ??
                  'https://i.imgur.com/UQyGT1Q.png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              height: 170,
              width: double.infinity,
              fadeInCurve: Curves.linearToEaseOut,
              fadeOutCurve: Curves.bounceInOut,
              placeholder: (context, url) => const AppLayoutShimmer(),
            ),
          ),
          Positioned(
            left: 16,
            child: Text(
              localization.explore,
              style: AppStyles.titleLarge.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                  color: AppColors.white),
            ),
          ),
          Positioned(
              right: 0,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(AppIcons.cloudyWhite),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.locationWhite),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            _blocMainScreen.currentLocationName?.trim() ?? '',
                            style: AppStyles.titleSmall.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.italic,
                                color: AppColors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '${_blocMainScreen.currentLocationTemperature}\u00B0',
                          textAlign: TextAlign.right,
                          style: AppStyles.titleLarge.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: AppColors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                    height: 0,
                  )
                ],
              )),
          Positioned(
              bottom: 15, left: 0, right: 0, child: _buildBottomTabExplore())
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Stack(
      children: [
        Container(
            alignment: Alignment.center,
            height: 60,
            color: AppColors.white,
            child: CustomPaint(
              size: const Size(double.infinity, 60),
              painter: RPSCustomPainter(),
            )),
        BlocBuilder<BlocMainScreen, BlocMainState>(
          buildWhen: (previous, current) =>
              current is BlocMainStateChangeTabIndex,
          builder: (context, blocMainState) {
            if (blocMainState is BlocMainStateChangeTabIndex) {
              return Container(
                color: AppColors.white,
                child: TabBar(
                    controller: _tabController,
                    indicatorPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    indicator: const BoxDecoration(color: AppColors.white),
                    indicatorColor: AppColors.white,
                    labelPadding: EdgeInsets.zero,
                    labelStyle: AppStyles.titleSmall.copyWith(
                        fontSize: 10,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500),
                    labelColor: AppColors.primary,
                    onTap: (value) {
                      if (blocMainState.index == value) {
                        // _scrollController[value].animateTo(0,
                        //     duration: const Duration(seconds: 0),
                        //     curve: Curves.fastLinearToSlowEaseIn);
                      }
                      BlocProvider.of<BlocMainScreen>(context)
                          .add(BlocMainEventChangeTabIndex(index: value));
                    },
                    tabs: List.generate(
                        icons.length,
                        (index) => Tab(
                              icon: SvgPicture.asset(
                                icons[index],
                                color: blocMainState.index == index
                                    ? AppColors.primary
                                    : AppColors.textSkipColor,
                                width: 30,
                                height: 28,
                              ),
                              iconMargin: const EdgeInsets.only(bottom: 2),
                              height: 50,
                              text: blocMainState.index == index
                                  ? titles[index]
                                  : '',
                            ))),
              );
            }
            return Container(
              color: AppColors.primary,
            );
          },
        )
      ],
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Paint shadowPaint = Paint()
      ..color = AppColors.underLineTextFieldColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(
        size.width * 0.4967083, size.height * -0.2311857, 0, 0);
    path0.close();

    canvas.drawPath(path0.shift(const Offset(0, 0)), shadowPaint);
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
