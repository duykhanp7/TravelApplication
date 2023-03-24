import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/explore/screens/explore_screen.dart';
import 'package:travel_booking_tour/features/location/trip_screen.dart';
import 'package:travel_booking_tour/features/main/blocs/bloc_main_event.dart';
import 'package:travel_booking_tour/features/main/blocs/bloc_main_screen.dart';
import 'package:travel_booking_tour/features/main/blocs/bloc_main_state.dart';
import 'package:travel_booking_tour/features/message/chat_screen.dart';
import 'package:travel_booking_tour/features/notification/notification_screen.dart';
import 'package:travel_booking_tour/features/profile/profile_screen.dart';
import 'package:travel_booking_tour/res/app_appbar.dart';
import 'package:travel_booking_tour/res/app_search.dart';

import '../../l10n/generated/l10n.dart';
import '../../res/colors.dart';
import '../../res/icons.dart';
import '../../res/images.dart';
import '../../res/system.dart';

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
  final ScrollController _scrollControllerTabLocation = ScrollController();
  final ScrollController _scrollControllerTabMessage = ScrollController();
  final ScrollController _scrollControllerTabNotification = ScrollController();
  final ScrollController _scrollControllerTabProfile = ScrollController();
  late TabController _tabController;
  late List<ScrollController> _scrollController;
  late BlocMainScreen _blocMainScreen;

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
    widgets.add(TripScreen(scrollController: _scrollControllerTabLocation));
    widgets.add(ChatScreen(scrollController: _scrollControllerTabMessage));
    widgets.add(
        NotificationScreen(scrollController: _scrollControllerTabNotification));
    widgets.add(ProfileScreen(scrollController: _scrollControllerTabProfile));

    _scrollController = <ScrollController>[];
    _scrollController.add(_scrollControllerTabExplore);
    _scrollController.add(_scrollControllerTabLocation);
    _scrollController.add(_scrollControllerTabMessage);
    _scrollController.add(_scrollControllerTabNotification);
    _scrollController.add(_scrollControllerTabProfile);

    _tabController = TabController(length: 5, vsync: this);

    _blocMainScreen = BlocProvider.of<BlocMainScreen>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _blocMainScreen.add(BlocmainEventInitial());
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildHeader(double.infinity),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              _buildBody(),
            ],
          ),
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
        preferredSize: Size(width, 155),
        child: SizedBox(
          width: width,
          child: BlocBuilder<BlocMainScreen, BlocMainState>(
            builder: (context, blocMainState) {
              if (blocMainState is BlocMainStateChangeTabIndex) {
                return AppbarAppWidget(
                  prefixWidget: Container(),
                  height: blocMainState.index == 4 ? 155 : 155,
                  flexibleSpace: blocMainState.index == 0
                      ? _buildExploreHeader(context)
                      : blocMainState.index == 4
                          ? _buildProfileHeader(width, context)
                          : _buildTripChatNotificationHeader(
                              width, blocMainState, context),
                  bottom: _buildBottom(blocMainState.index),
                );
              }
              return Container();
            },
          ),
        ));
  }

  PreferredSize? _buildBottom(int index) {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: index == 0
            ? _buildBottomTabExplore()
            : index == 4
                ? _buildBottomTabPersonal()
                : Container());
  }

  Widget _buildBottomTabPersonal() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: AppColors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      AppImages.imageProfile,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.contain,
                      height: 80,
                      width: 80,
                    ),
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
                                    color: AppColors.black.withOpacity(0.25)),
                                BoxShadow(
                                    offset: const Offset(2, 2),
                                    blurRadius: 5,
                                    color: AppColors.black.withOpacity(0.25))
                              ],
                              color: AppColors.white),
                          child: Material(
                              color: AppColors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(12),
                                highlightColor:
                                    AppColors.primary.withOpacity(0.5),
                                splashColor: AppColors.primary.withOpacity(0.5),
                                child: SvgPicture.asset(
                                  AppIcons.camera,
                                  color: AppColors.primary,
                                  width: 14,
                                  height: 11,
                                ),
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
                                splashColor: AppColors.white.withOpacity(0.3),
                                onTap: () {},
                              )),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomTabExplore() {
    return AppSearch(
      hintText: localization.hi_where_do_u_want_to_explore,
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
                    bottom: 30,
                    left: 1,
                    child: Container(
                      padding: const EdgeInsets.only(left: 16, bottom: 20),
                      child: Text(titles[blocMainState.index],
                          style: context.textStyle.titleLarge?.copyWith(
                              fontSize: 34,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic,
                              color: AppColors.white)),
                    )),
              ],
            ),
          )
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
                      children: [
                        SizedBox(
                          width: width,
                          child: Image.asset(
                            AppImages.defaultBg,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            height: 156,
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
                                    onTap: () {},
                                  )),
                            )),
                        Positioned(
                            bottom: 10,
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
                                        AppIcons.camera,
                                      ),
                                    ),
                                    onTap: () {},
                                  )),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildExploreHeader(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.bgHeaderXplore,
              fit: BoxFit.cover,
              height: 156,
            ),
          ),
          Positioned(
            left: 16,
            child: Text(
              localization.explore,
              style: context.textStyle.titleLarge?.copyWith(
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
                    width: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.locationWhite),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Da Nang',
                            style: context.textStyle.titleSmall?.copyWith(
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
                      Text(
                        '26\u00B0',
                        style: context.textStyle.titleLarge?.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )),
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
                    labelStyle: context.textStyle.titleSmall?.copyWith(
                        fontSize: 10,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500),
                    labelColor: AppColors.primary,
                    onTap: (value) {
                      if (blocMainState.index == value) {
                        _scrollController[value].animateTo(0,
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                      BlocProvider.of<BlocMainScreen>(context)
                          .add(BlocmainEventChangeTabIndex(index: value));
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
