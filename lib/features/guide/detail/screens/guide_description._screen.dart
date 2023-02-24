import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_detail_guide_event.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_detail_guide_screen.dart';
import 'package:travel_booking_tour/features/guide/detail/widgets/my_experience_item.dart';
import 'package:travel_booking_tour/features/guide/detail/widgets/review_guide_item.dart';

import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';
import 'package:video_viewer/video_viewer.dart';

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

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    _blocDetailGuideScreen = BlocProvider.of<BlocDetailGuideScreen>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> videoURL =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _blocDetailGuideScreen
        .add(BlocDetailGuideEventLoadVideo(videoUrl: videoURL['video']));
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
            AppImages.winterPicture,
            fit: BoxFit.cover,
            width: width,
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
                      child: Image.asset(AppImages.tuanTran),
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
                            'Tuan Tran',
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
                              '127 reviews',
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
                    child: PrimaryButton(
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
          const AppListChipWidget(
              chips: <String>['Vietnamese', 'English', 'Korean']),
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
                  'Da Nang, Viet Nam',
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
            'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
            style: context.textStyle.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textRadioItalicColor,
                height: 1.5),
          ),
          BlocBuilder<BlocDetailGuideScreen, BlocDetailGuideState>(
            buildWhen: (previous, current) =>
                current is BlocDetailGuideStateInitial ||
                current is BlocDetailGuideStateLoadVideoSuccess ||
                current is BlocDetailGuideStateLoadVideoFailure,
            builder: (context, state) {
              if (state is BlocDetailGuideStateLoadVideoSuccess) {
                return _buildVideo(state.source);
              } else if (state is BlocDetailGuideStateLoadVideoFailure) {
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: const CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              }
              return Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: const CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          _buildTablePrices(),
          _buildWidgetTourExperiences(),
          _buildWidgetReviews()
        ],
      ),
    );
  }

  Widget _buildVideo(Map<String, VideoSource> source) {
    if (source.isNotEmpty) {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: VideoViewer(
              style: VideoViewerStyle(
                loading: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset(AppIcons.icPause),
                ),
                thumbnail: Container(
                  alignment: Alignment.center,
                  color: AppColors.transparent,
                  child: Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30)),
                    child: SvgPicture.asset(
                      AppIcons.icPause,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                progressBarStyle: ProgressBarStyle(
                    bar: BarStyle.forward(
                        background: AppColors.white,
                        color: AppColors.primary,
                        identifier: AppColors.white)),
                playAndPauseStyle: PlayAndPauseWidgetStyle(
                    background: AppColors.transparent,
                    circleRadius: 50,
                    play: const Icon(
                      Icons.play_arrow,
                      color: AppColors.primary,
                      size: 30,
                    ),
                    pause: const Icon(
                      Icons.pause,
                      color: AppColors.primary,
                      size: 30,
                    )),
              ),
              rewindAmount: 5,
              forwardAmount: 5,
              language: VideoViewerLanguage.en,
              enableShowReplayIconAtVideoEnd: true,
              source: source),
        ),
      );
    }
    return Container(
      width: 350,
      height: 200,
      color: AppColors.primary,
    );
  }

  Widget _buildTablePrices() {
    return Container(
      alignment: Alignment.center,
      child: Table(
        border: TableBorder(
            borderRadius: BorderRadius.circular(10),
            top: const BorderSide(width: 1, color: AppColors.tableBorder),
            right: const BorderSide(width: 1, color: AppColors.tableBorder),
            bottom: const BorderSide(width: 1, color: AppColors.tableBorder),
            left: const BorderSide(width: 1, color: AppColors.tableBorder),
            horizontalInside: const BorderSide(
              width: 1,
              color: AppColors.tableBorder,
            ),
            verticalInside:
                const BorderSide(width: 1, color: AppColors.tableBorder)),
        children: [
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('1-3 Travelers',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.inActiveRadioBorderColor,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('\$10/hour',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.blackDefault,
                      fontWeight: FontWeight.w500)),
            )
          ]),
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('4-6 Travelers',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.inActiveRadioBorderColor,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('\$14/hour',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.blackDefault,
                      fontWeight: FontWeight.w500)),
            )
          ]),
          TableRow(children: [
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('7-9 Travelers',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.inActiveRadioBorderColor,
                      fontWeight: FontWeight.w500)),
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
              child: Text('\$17/hour',
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.blackDefault,
                      fontWeight: FontWeight.w500)),
            )
          ]),
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
          Text(
            'My Experiences',
            textAlign: TextAlign.left,
            style: context.textStyle.titleLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w100,
                color: AppColors.textOnboardingBlack,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 16,
          ),
          const MyExperienceItem(),
          const SizedBox(
            height: 20,
          ),
          const MyExperienceItem()
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
          const ReviewGuideItem(),
          const ReviewGuideItem(),
          const ReviewGuideItem(),
        ],
      ),
    );
  }
}
