import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/explore/widgets/featured_tour_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/journey_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/top_experience_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/tour_guide_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/travel_new_item.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/images.dart';
import 'package:travel_booking_tour/res/system.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExploreScreen();
  }
}

class _ExploreScreen extends State<ExploreScreen> {
  late SLocalization localization;
  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [_buildbody(), _buildHeader(width)],
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    return SizedBox(
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 185,
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

  Widget _buildbody() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            _buildTopJourneyWidget(),
            const SizedBox(
              height: 30,
            ),
            _buildBestGuide(),
            _buildTopExperiences(),
            _buildFeaturedTours(),
            _buildTravelNews()
          ],
        ),
      ),
    );
  }

  Widget _buildTopJourneyWidget() {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Top Journeys',
              style: context.textStyle.titleLarge?.copyWith(
                  fontSize: 24,
                  color: AppColors.black,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 260,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => JourneyItem(
                      rating: 5,
                      callback: () {},
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: 10),
          )
        ],
      ),
    );
  }

  Widget _buildBestGuide() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Best Guides',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TourGuideItem(
                callback: () {},
              ),
              const SizedBox(
                width: 15,
              ),
              TourGuideItem(
                callback: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TourGuideItem(callback: () {}),
              const SizedBox(
                width: 15,
              ),
              TourGuideItem(callback: () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTopExperiences() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Top Experiences',
              style: context.textStyle.titleLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 350,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => TopExperienceItem(
                      callback: () {},
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: 10),
          )
        ],
      ),
    );
  }

  Widget _buildFeaturedTours() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Featured Tours',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5, (index) => FeaturedTourItem(callback: () {}, rating: 5)),
          )
        ],
      ),
    );
  }

  Widget _buildTravelNews() {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Travel News',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(5, (index) => TravelNewItem(callback: () {})),
          )
        ],
      ),
    );
  }
}
