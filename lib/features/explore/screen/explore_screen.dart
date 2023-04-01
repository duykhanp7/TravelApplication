import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_screen.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_state.dart';

import 'package:travel_booking_tour/features/explore/widget/featured_tour_item.dart';
import 'package:travel_booking_tour/features/explore/widget/journey_item.dart';
import 'package:travel_booking_tour/features/explore/widget/top_experience_item.dart';
import 'package:travel_booking_tour/features/explore/widget/tour_guide_item.dart';
import 'package:travel_booking_tour/features/explore/widget/travel_new_item.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/app_layout_shimmer.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/system.dart';

import '../../../common/enum/enums.dart';
import '../../../data/model/tour_detail_json.dart';
import '../../../data/model/tour_guide_detail_json.dart';

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

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Container(
          alignment: Alignment.topCenter,
          child: _buildbody(context),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    super.initState();
  }

  Widget _buildbody(BuildContext context) {
    _blocExploreScreen.add(BlocExploreEventInitial(objects: const [
      TypeDestination.bestGuideJson,
      TypeDestination.featureTourJson,
      TypeDestination.topExperienceJson,
      TypeDestination.topJourneyJson,
      TypeDestination.travelNewJson
    ]));
    return BlocBuilder<BlocExploreScreen, BlocExploreState>(
      buildWhen: (previous, current) => current is BlocExploreStateLoadData,
      builder: (context, exploreState) {
        if (exploreState is BlocExploreStateLoadData) {
          return Container(
            color: AppColors.white,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              controller: widget.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildTopJourneyWidget((exploreState.appResult.result
                      as Map)[TypeDestination.topJourneyJson]),
                  const SizedBox(height: 30),
                  _buildBestGuide((exploreState.appResult.result
                      as Map)[TypeDestination.bestGuideJson]),
                  _buildTopExperiences((exploreState.appResult.result
                      as Map)[TypeDestination.topExperienceJson]),
                  _buildFeaturedTours((exploreState.appResult.result
                      as Map)[TypeDestination.featureTourJson]),
                  _buildTravelNews((exploreState.appResult.result
                      as Map)[TypeDestination.travelNewJson]),
                ],
              ),
            ),
          );
        }
        return const AppLayoutShimmer();
      },
    );
  }

  Widget _buildTopJourneyWidget(List<TourDetailJson> items) {
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
                      tourDetailJson: items[index],
                      callback: () {
                        _blocExploreScreen.add(BlocExploreEventOnTourClick(
                            tourDetailJson: items[index]));
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

  Widget _buildBestGuide(List<TourGuideDetailJson> items) {
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
                    onTap: () {
                      _blocExploreScreen.add(BlocExploreEventOnSeeMoreClick(
                          seeMoreType: SeeMoreType.guide));
                    },
                  ),
                ),
              )
            ],
          ),
          GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.only(top: 17),
            semanticChildCount: 4,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1 / 1.35,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            children: List.generate(
                4,
                (index) => TourGuideItem(
                    callback: () {
                      _blocExploreScreen.add(BlocExploreEventOnBestGuideClick(
                          tourGuideDetailJson: items[index]));
                    },
                    tourGuideDetailJson: items[index])),
          )
        ],
      ),
    );
  }

  Widget _buildTopExperiences(List<TourDetailJson> items) {
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
                      callback: () {
                        _blocExploreScreen.add(BlocExploreEventOnTourClick(
                            tourDetailJson: items[index]));
                      },
                      tourDetailJson: items[index],
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

  Widget _buildFeaturedTours(List<TourDetailJson> items) {
    return Container(
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
                    onTap: () {
                      _blocExploreScreen.add(BlocExploreEventOnSeeMoreClick(
                          seeMoreType: SeeMoreType.tour));
                    },
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
                            callback: () {
                              _blocExploreScreen.add(
                                  BlocExploreEventOnTourClick(
                                      tourDetailJson: items[index]));
                            },
                            tourDetailJson: items[index],
                          )),
                )
              : Container()
        ],
      ),
    );
  }

  Widget _buildTravelNews(List<TourDetailJson> items) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
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
                    onTap: () {
                      _blocExploreScreen.add(BlocExploreEventOnSeeMoreClick(
                          seeMoreType: SeeMoreType.news));
                    },
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                items.length,
                (index) => TravelNewItem(
                    tourDetailJson: items[index],
                    callback: () {
                      _blocExploreScreen.add(BlocExploreEventOnTourClick(
                          tourDetailJson: items[index]));
                    })),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
