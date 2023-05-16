import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';
import 'package:travel_booking_tour/data/model/tour_detail_json.dart';
import 'package:travel_booking_tour/data/model/tour_guide_detail_json.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_screen.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_screen.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_state.dart';
import 'package:travel_booking_tour/features/explore/widget/featured_tour_item.dart';
import 'package:travel_booking_tour/features/explore/widget/tour_guide_item.dart';
import 'package:travel_booking_tour/features/explore/widget/travel_new_item.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../common/app_constant.dart';
import '../../../common/enum/enums.dart';
import '../../../router/routes.dart';
import '../bloc/bloc_explore_event.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SeeMoreScreen();
  }
}

class _SeeMoreScreen extends State<SeeMoreScreen> {
  late BlocSeeMoreScreen _blocSeeMoreScreen;

  @override
  void initState() {
    _blocSeeMoreScreen = BlocProvider.of<BlocSeeMoreScreen>(context);

    _blocSeeMoreScreen.scrollController.addListener(() {
      //Scroll reach top
      //_scrollController.position.pixels == _scrollController.position.maxScrollExtent
      //Scroll reach bottom
      if (_blocSeeMoreScreen.scrollController.position.pixels ==
          _blocSeeMoreScreen.scrollController.position.maxScrollExtent) {
        if (!_blocSeeMoreScreen.isLoading) {
          _blocSeeMoreScreen.isLoading = true;
          _blocSeeMoreScreen.add(BlocSeeMoreEventLoadMore(
              seeMoreType: _blocSeeMoreScreen.seeMoreType!));
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    _blocSeeMoreScreen.seeMoreType = argument[AppConstant.data];

    if (_blocSeeMoreScreen.seeMoreType != null) {
      _blocSeeMoreScreen.add(BlocSeeMoreEventInitial(
          seeMoreType: _blocSeeMoreScreen.seeMoreType!));
    }

    return Scaffold(
      appBar: _buildAppBarWidget(),
      backgroundColor: AppColors.white,
      extendBody: true,
      extendBodyBehindAppBar: false,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BlocSeeMoreScreen, BlocSeeMoreState>(
      buildWhen: (previous, current) => current is BlocSeeMoreStateLoadData,
      builder: (context, state) {
        if (state is BlocSeeMoreStateLoadData) {
          if (state.appResult.state == ResultState.success) {
            _blocSeeMoreScreen.isLoading = false;
            _blocSeeMoreScreen.mainData.addAll(state.appResult.result.toList());
          } else if (state.appResult.state == ResultState.fail) {
            _blocSeeMoreScreen.isLoading = false;
          } else if (state.appResult.state == ResultState.loading) {
            return Container(
              alignment: Alignment.center,
              child: const AppLayoutShimmer(),
            );
          } else if (state.appResult.state == ResultState.loadingMore) {
            _blocSeeMoreScreen.isLoading = false;
            if (state.appResult.result != null) {
              if ((state.appResult.result as List).isNotEmpty) {
                _blocSeeMoreScreen.mainData
                    .addAll(state.appResult.result.toList());
              } else {
                _blocSeeMoreScreen.scrollController.animateTo(0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.linearToEaseOut);
              }
            }
          }

          if (_blocSeeMoreScreen.mainData.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                _blocSeeMoreScreen.add(BlocSeeMoreEventInitial(
                    seeMoreType:
                        _blocSeeMoreScreen.seeMoreType ?? SeeMoreType.guide));
                return;
              },
              child: Container(
                color: AppColors.white,
                child: SingleChildScrollView(
                  controller: _blocSeeMoreScreen.scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Stack(
                    children: [
                      _blocSeeMoreScreen.seeMoreType == SeeMoreType.guide
                          ? GridView.count(
                              crossAxisCount: 2,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 30, 16, 80),
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              childAspectRatio: 1 / 1.35,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              children: List.generate(
                                  _blocSeeMoreScreen.mainData.length,
                                  (index) => TourGuideItem(
                                      callback: () => _blocSeeMoreScreen.add(
                                          BlocSeeMoreEventOnItemClick(
                                              seeMoreType: _blocSeeMoreScreen
                                                  .seeMoreType!,
                                              data: _blocSeeMoreScreen
                                                      .mainData[index]
                                                  as TourGuideDetailJson)),
                                      tourGuideDetailJson:
                                          _blocSeeMoreScreen.mainData[index]
                                              as TourGuideDetailJson)),
                            )
                          : _blocSeeMoreScreen.seeMoreType == SeeMoreType.tour
                              ? ListView.builder(
                                  itemCount: _blocSeeMoreScreen.mainData.length,
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 30, 16, 80),
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) =>
                                      FeaturedTourItem(
                                          callback: () => _blocSeeMoreScreen
                                              .add(
                                                  BlocSeeMoreEventOnItemClick(
                                                      seeMoreType:
                                                          _blocSeeMoreScreen
                                                              .seeMoreType!,
                                                      data: _blocSeeMoreScreen
                                                                  .mainData[
                                                              index]
                                                          as TourDetailJson)),
                                          tourDetailJson:
                                              _blocSeeMoreScreen.mainData[index]
                                                  as TourDetailJson),
                                )
                              : ListView.builder(
                                  itemCount: _blocSeeMoreScreen.mainData.length,
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 30, 16, 80),
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) =>
                                      TravelNewItem(
                                          callback: () => BlocProvider.of<
                                                  BlocExploreScreen>(context)
                                              .add(BlocExploreEventOnNewsClick(
                                                  newsJson: _blocSeeMoreScreen
                                                          .mainData[index]
                                                      as NewsJson,
                                                  context,
                                                  false)),
                                          newsJson: _blocSeeMoreScreen
                                              .mainData[index] as NewsJson),
                                ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 20,
                          child: Visibility(
                              visible: state.appResult.state ==
                                  ResultState.loadingMore,
                              child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                child: const AppLayoutShimmer(),
                              )))
                    ],
                  ),
                ),
              ),
            );
          }
        }

        return const AppLayoutShimmer();
      },
    );
  }

  AppbarApp _buildAppBarWidget() {
    return AppbarApp(
      background: AppColors.transparent,
      height: 190,
      flexibleSpace: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(AppImages.seeMoreHeaderImage,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              height: 200),
          Container(height: 200, color: AppColors.black.withOpacity(0.2)),
          Container(
              padding: const EdgeInsets.only(left: 20, bottom: 40, right: 25),
              child: Text(
                _blocSeeMoreScreen.seeMoreType == SeeMoreType.guide
                    ? 'Book your own private local\nGuide and explore the city'
                    : 'Plenty of amazing of tours are waiting for you',
                style: AppStyles.titleMedium.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ))
        ],
      ),
      prefixWidget: AppInkWell(
          voidCallBack: () {
            Routes.backTo();
          },
          icon: AppIcons.icBack,
          background: AppColors.transparent),
      bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: Container(
            alignment: Alignment.center,
            child: AppSearch(
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 7),
                hintText:
                    'Hi, ${_blocSeeMoreScreen.seeMoreType == SeeMoreType.tour ? 'where do you want to explore?' : _blocSeeMoreScreen.seeMoreType == SeeMoreType.guide ? 'who do you want to choose?' : 'which news do you want to read?'}'),
          )),
    );
  }
}
