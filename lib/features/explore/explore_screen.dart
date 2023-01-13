import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_screen.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_state.dart';
import 'package:travel_booking_tour/features/explore/model/best_guide.dart';
import 'package:travel_booking_tour/features/explore/model/feature_tour.dart';
import 'package:travel_booking_tour/features/explore/model/top_experiences.dart';
import 'package:travel_booking_tour/features/explore/model/top_journey.dart';
import 'package:travel_booking_tour/features/explore/model/travel_news.dart';
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
  late BlocExploreScreen _blocExploreScreen;

  int indexClick = 0;
  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    _blocExploreScreen = BlocProvider.of<BlocExploreScreen>(context);

    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        alignment: Alignment.topCenter,
        child: _buildbody(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildbody(BuildContext context) {
    _blocExploreScreen.add(BlocExploreEventInitial(objects: [
      BestGuideJson(),
      FeatureTourJson(),
      TopExperienceJson(),
      TopJourneyJson(),
      TravelNewJson()
    ]));
    return BlocBuilder<BlocExploreScreen, BlocExploreState>(
      builder: (context, exploreState) {
        if (exploreState is BlocExploreStateLoadDataSuccess) {
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
                  _buildTopJourneyWidget(exploreState.topJourneyJsons),
                  const SizedBox(
                    height: 30,
                  ),
                  _buildBestGuide(exploreState.bestGuideJsons),
                  _buildTopExperiences(exploreState.topExperienceJsons),
                  _buildFeaturedTours(exploreState.featuresTourJsons),
                  _buildTravelNews(exploreState.travelNewJsons),
                ],
              ),
            ),
          );
        }
        return Container(
          alignment: Alignment.center,
          color: AppColors.white,
          child: const CircularProgressIndicator(
            color: AppColors.primary,
          ),
        );
      },
    );
  }

  Widget _buildTopJourneyWidget(List<TopJourneyJson> items) {
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
                      journeyJson: items[index],
                      callback: () {
                        _blocExploreScreen
                            .add(BlocExploreEventOnTopJourneyClick());
                      },
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: items.length),
          )
        ],
      ),
    );
  }

  Widget _buildBestGuide(List<BestGuideJson> items) {
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

  Widget _buildTopExperiences(List<TopExperienceJson> items) {
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
                      topExperienceJson: items[index],
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                itemCount: items.length),
          )
        ],
      ),
    );
  }

  Widget _buildFeaturedTours(List<FeatureTourJson> items) {
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
          items.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      items.length,
                      (index) => FeaturedTourItem(
                            callback: () {},
                            featureTourJson: items[index],
                          )),
                )
              : Container()
        ],
      ),
    );
  }

  Widget _buildTravelNews(List<TravelNewJson> items) {
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
            children: List.generate(
                items.length,
                (index) => TravelNewItem(
                    travelNewJson: items[index], callback: () {})),
          )
        ],
      ),
    );
  }
}
