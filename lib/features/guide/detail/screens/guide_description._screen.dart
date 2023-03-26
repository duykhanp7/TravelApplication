import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/tour_guide_detail_json.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_detail_guide_event.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_detail_guide_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/widgets/my_experience_item.dart';
import 'package:travel_booking_tour/features/guide/detail/widgets/review_guide_item.dart';

import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

import '../blocs/bloc_detail_guide_state.dart';

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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> datas =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    tourGuideDetailJson = datas['data'] as TourGuideDetailJson;

    _blocDetailGuideScreen.add(BlocDetailGuideEventLoadVideo(
        videoUrl: tourGuideDetailJson.videoIntroductionUrl ?? ''));

    return Scaffold(
      body: WillPopScope(
        child: Container(
          color: AppColors.white,
          alignment: Alignment.topCenter,
          child: Stack(
            children: [
              _buildBody(context),
              _buildHeader(context),
            ],
          ),
        ),
        onWillPop: () async {
          _blocDetailGuideScreen.add(BlocDetailGuideEventClose());
          return true;
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: AppColors.transparent,
      child: Stack(children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            tourGuideDetailJson.coverImageUrl ?? AppImages.winterPicture,
            fit: BoxFit.cover,
            width: width,
            height: 170,
          ),
        ),
        Positioned(
            left: 5,
            top: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: AppColors.transparent,
                  child: SvgPicture.asset(
                    AppIcons.icBack,
                    width: 20,
                    height: 20,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.transparent),
                  child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.transparent,
                      child: InkWell(
                        highlightColor: AppColors.white.withOpacity(0.1),
                        splashColor: AppColors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: AppColors.transparent,
                        ),
                        onTap: () {
                          _blocDetailGuideScreen
                              .add(BlocDetailGuideEventClose());
                        },
                      )),
                )
              ],
            )),
        Positioned(
            bottom: 0,
            left: 16,
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                          tourGuideDetailJson.profileImageUrl ?? ''),
                    ),
                  )
                ],
              ),
            ))
      ]),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 200),
        alignment: Alignment.topCenter,
        child: Column(
          children: [_buildBodyInformation()],
        ),
      ),
    );
  }

  Widget _buildBodyInformation() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tourGuideDetailJson.name ?? '',
                            style: context.textStyle.titleLarge?.copyWith(
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
                              '${tourGuideDetailJson.reviews?.length ?? 0} reviews',
                              style: context.textStyle.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.inActiveRadioBorderColor),
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
                      height: 50,
                      width: 160,
                      margin: const EdgeInsets.only(left: 8, right: 0),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          AppListChipWidget(chips: tourGuideDetailJson.languages ?? []),
          const SizedBox(
            height: 8,
          ),
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
                  tourGuideDetailJson.address ?? '',
                  style: context.textStyle.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400, color: AppColors.primary),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            tourGuideDetailJson.description ?? '',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          const SizedBox(height: 30),
          BlocBuilder<BlocDetailGuideScreen, BlocDetailGuideState>(
            buildWhen: (previous, current) =>
                current is BlocDetailGuideStateInitial ||
                current is BlocDetailGuideStateLoadVideoSuccess ||
                current is BlocDetailGuideStateLoadVideoFailure,
            builder: (context, state) {
              if (state is BlocDetailGuideStateLoadVideoSuccess) {
                return AppVideo(
                  source: state.source,
                  videoViewerController:
                      _blocDetailGuideScreen.videoViewerController,
                );
              } else if (state is BlocDetailGuideStateLoadVideoFailure) {
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: const CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2,
                      backgroundColor: AppColors.white),
                );
              }
              return Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: const CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2,
                    backgroundColor: AppColors.white),
              );
            },
          ),
          const SizedBox(
            height: 35,
          ),
          AppTable(datas: tourGuideDetailJson.prices ?? {}),
          _buildWidgetTourExperiences(),
          _buildWidgetReviews()
        ],
      ),
    );
  }

  Widget _buildWidgetTourExperiences() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Text(
                'My Experiences',
                textAlign: TextAlign.left,
                style: context.textStyle.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w100,
                    color: AppColors.textOnboardingBlack,
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                  tourGuideDetailJson.experiences?.length ?? 0,
                  (index) => MyExperienceItem(
                      tourDetailJson: tourGuideDetailJson.experiences?[index]))
            ],
          )
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
                  style: context.textStyle.titleLarge?.copyWith(
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
                      style: context.textStyle.titleSmall
                          ?.copyWith(color: AppColors.primary),
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
          ...List.generate(
            tourGuideDetailJson.reviews?.length ?? 0,
            (index) => ReviewGuideItem(
                reviewJson: tourGuideDetailJson.reviews?[index]),
          )
        ],
      ),
    );
  }
}
