import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/explore/explore_screen.dart';
import 'package:travel_booking_tour/features/location/trip_screen.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_event.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_screen.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_state.dart';
import 'package:travel_booking_tour/features/message/chat_screen.dart';
import 'package:travel_booking_tour/features/notification/notification_screen.dart';
import 'package:travel_booking_tour/features/profile/profile_screen.dart';

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BlocMainScreen>(context).add(BlocmainEventInitial());
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          alignment: Alignment.topCenter,
          child: Stack(
            children: [_buildBody(), _buildHeader(width)],
          ),
        ),
      ),
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

  Widget _buildHeader(double width) {
    return SizedBox(
      width: width,
      child: BlocBuilder<BlocMainScreen, BlocMainState>(
        builder: (context, blocMainState) {
          if (blocMainState is BlocMainStateChangeTabIndex) {
            if (blocMainState.index == 0) {
              return _buildExploreHeader(context);
            } else if (blocMainState.index == 4) {
              return _buildProfileHeader(width, context);
            } else {
              return _buildTripChatNotificationHeader(
                  width, blocMainState, context);
            }
          }
          return Container();
        },
      ),
    );
  }

  SizedBox _buildTripChatNotificationHeader(double width,
      BlocMainStateChangeTabIndex blocMainState, BuildContext context) {
    return SizedBox(
      height: 185,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.bgHeaderXplore,
              fit: BoxFit.contain,
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
      height: 225,
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
                    height: 156,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: width,
                          child: Image.asset(
                            AppImages.defaultBg,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
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
                                      height: 15,
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
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 30, top: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Yoo Jin',
                        textAlign: TextAlign.right,
                        style: context.textStyle.titleLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w100,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'yoojin@gmail.com',
                        textAlign: TextAlign.right,
                        style: context.textStyle.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.textSkipColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              left: 16,
              bottom: 25,
              child: SizedBox(
                height: 100,
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
                                    onTap: () {},
                                  )),
                            )
                          ],
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Container _buildExploreHeader(BuildContext context) {
    return Container(
      height: 185,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.bgHeaderXplore,
              fit: BoxFit.contain,
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
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: const Offset(-2, 2),
                          blurRadius: 3,
                          color: AppColors.textSkipColor.withOpacity(0.3))
                    ]),
                height: 40,
                child: TextFormField(
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w400),
                  cursorColor: AppColors.textSkipColor,
                  decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          AppIcons.search,
                          width: 16,
                          height: 16,
                          fit: BoxFit.none,
                        ),
                      ),
                      hintStyle: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSkipColor),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: localization.hi_where_do_u_want_to_explore),
                ),
              ))
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
              size: Size(MediaQuery.of(context).size.width, 60),
              painter: RPSCustomPainter(),
            )),
        // Container(
        //   alignment: Alignment.center,
        //   height: 60,
        //   color: AppColors.white,
        //   child: Row(
        //     children: List.generate(
        //         icons.length,
        //         (index) => BottomNavItem(
        //               index: index,
        //               icon: icons[index],
        //               title: titles[index],
        //               clicked: index == indexClick,
        //               onClick: (index) {
        //                 setState(() {
        //                   indexClick = index;
        //                   if (indexClick == 0) {
        //                     scrollController.animateTo(0,
        //                         duration: const Duration(seconds: 2),
        //                         curve: Curves.fastLinearToSlowEaseIn);
        //                   }
        //                 });
        //               },
        //             )),
        //   ),
        // ),
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
