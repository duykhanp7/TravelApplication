import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/schedule_json.dart';
import 'package:travel_booking_tour/data/models/tour_detail_json.dart';
import 'package:travel_booking_tour/features/auth/signup/widgets/choose_date_widget.dart';
import 'package:travel_booking_tour/features/tour/detail/blocs/bloc_tour_detail_event.dart';
import 'package:travel_booking_tour/features/tour/detail/blocs/bloc_tour_detail_screen.dart';
import 'package:travel_booking_tour/features/tour/detail/blocs/bloc_tour_detail_state.dart';
import 'package:travel_booking_tour/features/tour/detail/widgets/schedule_point.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

import '../../../router/routes.dart';

class TourDetailScreen extends StatefulWidget {
  const TourDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TourDetailScreen();
  }
}

class _TourDetailScreen extends State<TourDetailScreen> {
  late BlocTourDetailScreen _blocTourDetailScreen;
  final PageController _pageController = PageController();
  late TourDetailJson _tourDetailJson;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemLightStatusBar);
    _blocTourDetailScreen = BlocProvider.of<BlocTourDetailScreen>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> datas =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _tourDetailJson = datas['data'] as TourDetailJson;
    _blocTourDetailScreen.add(BlocTourDetailEventInitial());

    return Scaffold(
      appBar: AppbarAppWidget(
        background: AppColors.transparent,
        prefixWidget: AppInkWell(
            voidCallBack: () => Routes.backTo(),
            icon: AppIcons.icBack,
            background: AppColors.transparent),
        suffixWidget: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            children: [
              AppInkWell(
                  size: const Size(30, 30),
                  voidCallBack: () {
                    _blocTourDetailScreen
                        .add(BlocTourDetailEventShowBottomSheetShare());
                  },
                  icon: AppIcons.icShare),
              const SizedBox(width: 14),
              AppInkWell(
                  size: const Size(30, 30),
                  iconSize: const Size(15, 15),
                  voidCallBack: () {},
                  iconTint: AppColors.white,
                  icon: _tourDetailJson.isFavorite == null
                      ? AppIcons.icFavoriteWhiteNull
                      : _tourDetailJson.isFavorite!
                          ? AppIcons.favoriteFill
                          : AppIcons.icFavoriteWhiteNull),
              const SizedBox(width: 14),
              AppInkWell(
                  size: const Size(30, 30),
                  voidCallBack: () {},
                  icon: AppIcons.icBookMarkWhiteNull)
            ],
          ),
        ),
        height: 200,
        flexibleSpace: BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
          buildWhen: (previous, current) =>
              current is BlocTourDetailStateLoading ||
              current is BlocTourDetailStateLoadingSuccess ||
              current is BlocTourDetailStateLoadingFail,
          builder: (context, state) {
            if (state is BlocTourDetailStateLoading) {
              return Container(
                alignment: Alignment.center,
                color: AppColors.black.withOpacity(0.1),
                child: const CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2,
                    backgroundColor: AppColors.white),
              );
            } else if (state is BlocTourDetailStateLoadingSuccess) {
              return _buildImageSlider(_tourDetailJson.images ?? []);
            }
            return Container();
          },
        ),
      ),
      body: BlocListener<BlocTourDetailScreen, BlocTourDetailState>(
        listenWhen: (previous, current) =>
            current is BlocTourDetailStateShowBottomSheetShare,
        listener: (context, state) {
          if (state is BlocTourDetailStateShowBottomSheetShare) {
            showCupertinoModalPopup(
              context: context,
              barrierDismissible: true,
              builder: (context) => CupertinoActionSheet(
                actions: [
                  Container(
                    color: AppColors.white,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Share on',
                            style: context.textStyle.titleMedium?.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black),
                          ),
                        ),
                        const SizedBox(height: 23),
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            children: [
                              SocialButton(
                                width: 60,
                                height: 60,
                                radius: 14,
                                title: 'Facebook',
                                icon: AppIcons.icFacebookFrame,
                                background: AppColors.facebookBgColor,
                                splash: AppColors.white.withOpacity(0.2),
                                voidCallback: () {},
                              ),
                              const SizedBox(width: 10),
                              SocialButton(
                                width: 60,
                                height: 60,
                                radius: 14,
                                title: 'Google',
                                icon: AppIcons.icGoogleFrame,
                                background: AppColors.googleBgColor,
                                splash: AppColors.white.withOpacity(0.2),
                                voidCallback: () {},
                              ),
                              const SizedBox(width: 10),
                              SocialButton(
                                width: 60,
                                height: 60,
                                radius: 14,
                                title: 'Kakao Talk',
                                icon: AppIcons.icTalkFrame,
                                background: AppColors.talkBgColor,
                                splash: AppColors.white.withOpacity(0.2),
                                voidCallback: () {},
                              ),
                              const SizedBox(width: 10),
                              SocialButton(
                                width: 60,
                                height: 60,
                                radius: 14,
                                title: 'Whatsapp',
                                icon: AppIcons.icWhatAppFrame,
                                background: AppColors.whatAppBgColor,
                                splash: AppColors.white.withOpacity(0.2),
                                voidCallback: () {},
                              ),
                              const SizedBox(width: 10),
                              SocialButton(
                                width: 60,
                                height: 60,
                                radius: 14,
                                title: 'Twitter',
                                icon: AppIcons.icTwitterFrame,
                                background: AppColors.twitterBgColor,
                                splash: AppColors.white.withOpacity(0.2),
                                voidCallback: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
                cancelButton: CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.italic,
                          color: AppColors.primary),
                    )),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.white,
            child: _buildbody(),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100,
        padding: const EdgeInsets.only(left: 32, top: 12, right: 32),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 13,
              color: AppColors.black.withOpacity(0.1))
        ], color: AppColors.white),
        child: PrimaryButton(
          margin: EdgeInsets.zero,
          text: 'Book this tour',
          onTap: () {},
          allCaps: true,
        ),
      ),
      extendBody: true,
    );
  }

  Widget _buildImageSlider(List<String> images) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) => Image.asset(
              images[index],
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              height: 200,
            ),
            controller: _pageController,
            onPageChanged: (value) => _blocTourDetailScreen
                .add(BlocTourDetailEventChangeIndexImageSlider(index: value)),
            itemCount: images.length,
          ),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
                buildWhen: (previous, current) =>
                    current is BlocTourDetailStateChangeIndexImageSlider,
                builder: (context, state) {
                  if (state is BlocTourDetailStateChangeIndexImageSlider) {
                    return _buildIndicator(state.index, images.length);
                  }
                  return Container();
                },
              ))
        ],
      ),
    );
  }

  Widget _buildIndicator(int position, int length) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            length,
            (index) => Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: index == position ? 20 : 10,
                  height: 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == position
                          ? AppColors.primary
                          : AppColors.white),
                )),
      ),
    );
  }

  Widget _buildbody() {
    debugPrint('Rebuild when show dialog');
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _tourDetailJson.destination ?? '',
                style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColors.black),
              ),
              Text('\$${_tourDetailJson.price ?? 0}',
                  style: context.textStyle.titleMedium?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: AppColors.primary,
                      fontStyle: FontStyle.italic))
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const HorizontalStarWidget(rating: 5),
                  const SizedBox(width: 10),
                  Text(
                    '${_tourDetailJson.reviews ?? 0} reviews',
                    style: context.textStyle.titleSmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textHintColor),
                  )
                ],
              ),
              Text(
                '\$${_tourDetailJson.saleOff}',
                style: context.textStyle.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textHintColor,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Provider',
                style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textByAgreeColor),
              ),
              const SizedBox(width: 24),
              Text(_tourDetailJson.provider?.name ?? '',
                  style: context.textStyle.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.primary))
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 1),
                  )
                ]),
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 15, 16, 22),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Summary',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: AppColors.black)),
                  const SizedBox(height: 15),
                  Text('Itinerary',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textByAgreeColor)),
                  const SizedBox(height: 4),
                  Text(_tourDetailJson.destination ?? '',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textOnboardingBlack)),
                  const SizedBox(height: 14),
                  Text('Duration',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textByAgreeColor)),
                  const SizedBox(height: 4),
                  Text(_tourDetailJson.duration ?? '',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textOnboardingBlack)),
                  const SizedBox(height: 14),
                  Text('Departure date',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textByAgreeColor)),
                  const SizedBox(height: 4),
                  Text(_tourDetailJson.departureDate ?? '',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textOnboardingBlack)),
                  const SizedBox(height: 14),
                  Text('Departure place',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.textByAgreeColor)),
                  const SizedBox(height: 4),
                  Text(_tourDetailJson.departurePlace ?? '',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textOnboardingBlack)),
                ],
              ),
            ),
          ),
          _buildScheduleWidget()
        ],
      ),
    );
  }

  Widget _buildScheduleWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.icSchedule,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 12),
            Text('Schedule',
                style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColors.black))
          ],
        ),
        const SizedBox(height: 21),
        BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
          buildWhen: (previous, current) =>
              current is BlocTourDetailStateChangeIndexSchedule,
          builder: (context, state) {
            if (state is BlocTourDetailStateChangeIndexSchedule) {
              ScheduleJson? scheduleJson =
                  _tourDetailJson.schedule?[state.index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChooseDateWidget(
                    current: state.index,
                    dates: List.generate(_tourDetailJson.schedule?.length ?? 0,
                        (index) => 'Day ${index + 1}'),
                    onClick: (index) {
                      _blocTourDetailScreen.add(
                          BlocTourDetailEventChangeIndexSchedule(index: index));
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(scheduleJson?.name ?? 'No departure palace',
                      style: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 16)),
                  const SizedBox(height: 14),
                  ListView.builder(
                    itemCount: scheduleJson?.schedules?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => DestinationPoint(
                      time: scheduleJson?.schedules?[index].time ?? '',
                      description: state.index == 0
                          ? 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'
                          : 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.',
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
        const SizedBox(height: 70),
        Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.icDollarCircle),
                const SizedBox(width: 7),
                Text('Price',
                    style: context.textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: AppColors.black))
              ],
            ),
            const SizedBox(height: 10),
            AppTable(datas: _tourDetailJson.prices ?? {})
          ],
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
