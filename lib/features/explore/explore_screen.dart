import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/explore/widgets/featured_tour_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/journey_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/top_experience_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/tour_guide_item.dart';
import 'package:travel_booking_tour/features/explore/widgets/travel_new_item.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/system.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<StatefulWidget> createState() {
    return _ExploreScreen();
  }
}

class _ExploreScreen extends State<ExploreScreen> {
  late SLocalization localization;

  int indexClick = 0;
  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        alignment: Alignment.topCenter,
        child: _buildbody(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildbody() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        physics: const BouncingScrollPhysics(),
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
                physics: const BouncingScrollPhysics(),
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
                physics: const BouncingScrollPhysics(),
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
