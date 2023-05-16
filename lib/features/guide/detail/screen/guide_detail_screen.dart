import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_event.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_screen.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';
import 'package:video_viewer/domain/entities/video_source.dart';

import '../../../../common/app_constant.dart';
import '../../../../data/model/tour_guide_detail_json.dart';
import '../bloc/bloc_detail_guide_state.dart';

class GuideDescriptionScreen extends StatefulWidget {
  const GuideDescriptionScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GuideDescriptionScreen();
  }
}

class _GuideDescriptionScreen extends State<GuideDescriptionScreen> {
  late BlocDetailGuideScreen _blocDetailGuideScreen;
  late TourGuideDetailJson tourGuideDetailJson;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    _blocDetailGuideScreen = BlocProvider.of<BlocDetailGuideScreen>(context);
    _blocDetailGuideScreen.add(BlocDetailGuideEventInitial());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> datas =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    tourGuideDetailJson = datas[AppConstant.data] as TourGuideDetailJson;

    _blocDetailGuideScreen.setTourGuideDetailJson(tourGuideDetailJson);

    return WillPopScope(
      onWillPop: () async {
        _blocDetailGuideScreen.add(BlocDetailGuideEventClose());
        return true;
      },
      child: Scaffold(
        appBar: AppbarApp(
            prefixWidget: Container(),
            height: 160,
            background: AppColors.transparent,
            flexibleSpace: _buildHeader(context)),
        body: RefreshIndicator(
          edgeOffset: 200,
          onRefresh: () async {
            if (!_blocDetailGuideScreen.isLoading) {
              _blocDetailGuideScreen.add(BlocDetailGuideEventInitial());
            }
            return;
          },
          child: BlocBuilder<BlocDetailGuideScreen, BlocDetailGuideState>(
            buildWhen: (previous, current) =>
                current is BlocDetailGuideStateLoadDataResult,
            builder: (context, state) => Container(
              color: AppColors.white,
              alignment: Alignment.topCenter,
              child: Stack(
                children: [
                  _buildBody(context, state),
                ],
              ),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: AppColors.transparent,
      child: Stack(children: [
        BlocBuilder<BlocDetailGuideScreen, BlocDetailGuideState>(
          buildWhen: (previous, current) =>
              current is BlocDetailGuideStateLoadDataResult,
          builder: (context, state) {
            if (state is BlocDetailGuideStateLoadDataResult) {
              if (state.appResult.state == ResultState.success) {
                return Container(
                  alignment: Alignment.topCenter,
                  color: AppColors.transparent,
                  child: CachedNetworkImage(
                    imageUrl: 'https://i.imgur.com/mL5BwvK.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    fadeInCurve: Curves.linearToEaseOut,
                    fadeOutCurve: Curves.bounceInOut,
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppIcons.icErrorImage),
                    placeholder: (context, url) => const AppLayoutShimmer(),
                  ),
                );
              }
            }
            return Container(
              alignment: Alignment.center,
              color: AppColors.transparent,
              child: const AppLayoutShimmer(
                background: AppColors.brown,
              ),
            );
          },
        ),
        Positioned(
            left: 5,
            top: 50,
            child: AppInkWell(
                background: AppColors.transparent,
                voidCallBack: () =>
                    _blocDetailGuideScreen.add(BlocDetailGuideEventClose()),
                icon: AppIcons.icBack)),
        Positioned(
            bottom: 0,
            left: 16,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: BlocBuilder<BlocDetailGuideScreen, BlocDetailGuideState>(
                buildWhen: (previous, current) =>
                    current is BlocDetailGuideStateLoadDataResult,
                builder: (context, state) {
                  if (state is BlocDetailGuideStateLoadDataResult) {
                    if (state.appResult.state == ResultState.success) {
                      return Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CachedNetworkImage(
                            imageUrl: tourGuideDetailJson
                                    .attributes
                                    ?.user
                                    ?.data
                                    ?.attributes
                                    ?.avatar
                                    ?.data
                                    ?.attributes
                                    ?.url ??
                                '',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 80,
                            fadeInCurve: Curves.linearToEaseOut,
                            fadeOutCurve: Curves.bounceInOut,
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(AppIcons.icErrorImage),
                            placeholder: (context, url) =>
                                const AppLayoutShimmer(),
                          ),
                        ),
                      );
                    }
                  }
                  return Container(
                    alignment: Alignment.center,
                    color: AppColors.transparent,
                    child: const AppLayoutShimmer(
                      visibilityLoading: false,
                      background: AppColors.brown,
                    ),
                  );
                },
              ),
            ))
      ]),
    );
  }

  Widget _buildBody(BuildContext context, BlocDetailGuideState state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 200),
        alignment: Alignment.topCenter,
        child: Column(
          children: [_buildBodyInformation(state)],
        ),
      ),
    );
  }

  Widget _buildVideoWidget(BlocDetailGuideState state) {
    if (state is BlocDetailGuideStateLoadDataResult) {
      if (state.appResult.state == ResultState.success) {
        final data = _blocDetailGuideScreen
            .tourGuideDetailJson?.attributes?.videoIntroduction['data'];
        if (data is Iterable) {
          final List<String> urls =
              data.map((e) => e['attributes']['url'].toString()).toList();
          if (data.isNotEmpty) {
            return AppVideo(
              source: VideoSource.fromNetworkVideoSources({'video': urls[0]}),
              videoViewerController:
                  _blocDetailGuideScreen.videoViewerController,
            );
          } else {
            return Container();
          }
        } else {
          return Container();
        }
      }
    }
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: const AppLayoutShimmer(),
    );
  }

  Widget _buildBodyInformation(BlocDetailGuideState state) {
    bool isLoading = false;
    if (state is BlocDetailGuideStateLoadDataResult) {
      if (state.appResult.state == ResultState.loading) {
        isLoading = true;
      } else if (state.appResult.state == ResultState.success ||
          state.appResult.state == ResultState.fail ||
          state.appResult.state == ResultState.error) {
        isLoading = false;
      }
    }
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: isLoading
                      ? Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: 200,
                          height: 100,
                          child: const AppLayoutShimmer(
                            visibilityLoading: false,
                            background: AppColors.brown,
                            borderRadius: 5,
                          ),
                        )
                      : Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  (tourGuideDetailJson.attributes?.user?.data
                                              ?.attributes?.lastName ??
                                          '') +
                                      (tourGuideDetailJson.attributes?.user
                                              ?.data?.attributes?.firstName ??
                                          ''),
                                  style: AppStyles.titleLarge.copyWith(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w100,
                                      color: AppColors.blackDefault,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const HorizontalStarWidget(rating: 5),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '${0} reviews',
                                    style: AppStyles.titleSmall.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            AppColors.inActiveRadioBorderColor),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
              Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: PrimaryActiveButton(
                      text: 'Choose This Guide',
                      onTap: () {
                        _blocDetailGuideScreen.add(
                            BlocDetailGuideEventChooseThisGuide(
                                current: DateTime.now().millisecond));
                      },
                      allCaps: true,
                      isLoading: isLoading,
                      height: 50,
                      width: 160,
                      margin: const EdgeInsets.only(left: 8, right: 0),
                    ),
                  ))
            ],
          ),
          isLoading
              ? Container()
              : Column(
                  children: [
                    const SizedBox(height: 5),
                    AppListChipWidget(
                        chips: tourGuideDetailJson.attributes?.language
                                ?.split(',') ??
                            []),
                    const SizedBox(height: 8),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.locationGreen,
                            width: 14,
                            height: 18,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            '${tourGuideDetailJson.attributes?.city ?? ''}, ${tourGuideDetailJson.attributes?.user?.data?.attributes?.country ?? ''}',
                            style: AppStyles.titleSmall.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 14),
          isLoading
              ? Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  height: 250,
                  child: const AppLayoutShimmer(
                    borderRadius: 5,
                    visibilityLoading: false,
                    background: AppColors.brown,
                  ))
              : Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    tourGuideDetailJson.attributes?.introduction ?? '',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textRadioItalicColor,
                        height: 1.5),
                    textAlign: TextAlign.start,
                  ),
                ),
          _buildVideoWidget(state),
          const SizedBox(height: 35),
          isLoading
              ? const SizedBox(
                  height: 400,
                  child: AppLayoutShimmer(
                    borderRadius: 5,
                    visibilityLoading: false,
                    background: AppColors.brown,
                  ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTable(datas: {
                      '1 - 3 Travelers': _blocDetailGuideScreen.fee13,
                      '4 - 6 Travelers': _blocDetailGuideScreen.fee46,
                      '7 - 9 Travelers': _blocDetailGuideScreen.fee79,
                      '10 - 14 Travelers': _blocDetailGuideScreen.fee1014
                    }),
                    const SizedBox(height: 35),
                    //_buildWidgetTourExperiences(),
                    //_buildWidgetReviews()
                  ],
                )
        ],
      ),
    );
  }

  Widget _buildWidgetTourExperiences() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Experiences',
            textAlign: TextAlign.start,
            style: AppStyles.titleLarge.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w100,
                color: AppColors.textOnboardingBlack,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16),
          // ...List.generate(
          //     tourGuideDetailJson.experiences?.length ?? 0,
          //     (index) => MyExperienceItem(
          //           myExperienceJson: tourGuideDetailJson.experiences?[index],
          //           edited: false,
          //         ))
        ],
      ),
    );
  }

  Widget _buildWidgetReviews() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Reviews',
                  style: AppStyles.titleLarge.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w100,
                      color: AppColors.textOnboardingBlack,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const Spacer(),
              Container(
                height: 20,
                alignment: Alignment.center,
                child: Material(
                  color: AppColors.transparent,
                  child: InkWell(
                    splashColor: AppColors.primary.withOpacity(0.1),
                    child: Text(
                      'SEE MORE',
                      style: AppStyles.titleSmall
                          .copyWith(color: AppColors.primary),
                    ),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          // ...List.generate(
          //   tourGuideDetailJson.reviews?.length ?? 0,
          //   (index) => ReviewGuideItem(
          //       reviewJson: tourGuideDetailJson.reviews?[index]),
          // )
        ],
      ),
    );
  }
}
