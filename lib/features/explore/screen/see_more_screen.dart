import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_event.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_screen.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_see_more_state.dart';
import 'package:travel_booking_tour/features/explore/widget/featured_tour_item.dart';
import 'package:travel_booking_tour/features/explore/widget/tour_guide_item.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../common/app_constant.dart';
import '../../../common/enum/enums.dart';
import '../../../router/routes.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SeeMoreScreen();
  }
}

class _SeeMoreScreen extends State<SeeMoreScreen> {
  late SeeMoreType? seeMoreType;
  late BlocSeeMoreScreen _blocSeeMoreScreen;
  final ScrollController _scrollController = ScrollController();
  List<dynamic> mainData = [];
  bool isLoading = false;

  @override
  void initState() {
    _blocSeeMoreScreen = BlocProvider.of<BlocSeeMoreScreen>(context);

    _scrollController.addListener(() {
      //Scroll reach top
      //_scrollController.position.pixels == _scrollController.position.maxScrollExtent
      //Scroll reach bottom
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          isLoading = true;
          _blocSeeMoreScreen
              .add(BlocSeeMoreEventLoadMore(seeMoreType: seeMoreType!));
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> argument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    seeMoreType = argument[AppConstant.data];

    if (seeMoreType != null) {
      _blocSeeMoreScreen
          .add(BlocSeeMoreEventInitial(seeMoreType: seeMoreType!));
    } else {}

    return Scaffold(
      appBar: _buildAppBarWidget(),
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
            isLoading = false;
            mainData.addAll(state.appResult.result.toList());
          } else if (state.appResult.state == ResultState.fail) {
            isLoading = false;
          }

          if (mainData.isNotEmpty) {
            return SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  seeMoreType == SeeMoreType.guide
                      ? GridView.count(
                          crossAxisCount: 2,
                          padding: const EdgeInsets.fromLTRB(16, 30, 16, 80),
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          childAspectRatio: 1 / 1.35,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10,
                          children: List.generate(
                              mainData.length,
                              (index) => TourGuideItem(
                                  callback: () => _blocSeeMoreScreen.add(
                                      BlocSeeMoreEventOnItemClick(
                                          seeMoreType: seeMoreType!,
                                          data: mainData[index])),
                                  tourGuideDetailJson: mainData[index])),
                        )
                      : seeMoreType == SeeMoreType.tour
                          ? ListView.builder(
                              itemCount: mainData.length,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 30, 16, 80),
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => FeaturedTourItem(
                                  callback: () => _blocSeeMoreScreen.add(
                                      BlocSeeMoreEventOnItemClick(
                                          seeMoreType: seeMoreType!,
                                          data: mainData[index])),
                                  tourDetailJson: mainData[index]),
                            )
                          : ListView.builder(
                              itemCount: mainData.length,
                              padding:
                                  const EdgeInsets.fromLTRB(16, 30, 16, 80),
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => FeaturedTourItem(
                                  callback: () => _blocSeeMoreScreen.add(
                                      BlocSeeMoreEventOnItemClick(
                                          seeMoreType: seeMoreType!,
                                          data: mainData[index])),
                                  tourDetailJson: mainData[index]),
                            ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: Visibility(
                          visible:
                              state.appResult.state == ResultState.loadingMore,
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: const AppLayoutShimmer(),
                          )))
                ],
              ),
            );
          }
        }

        return const AppLayoutShimmer();
      },
    );
  }

  AppbarAppWidget _buildAppBarWidget() {
    return AppbarAppWidget(
      background: AppColors.transparent,
      height: 190,
      flexibleSpace: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            AppImages.seeMoreHeaderImage,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            height: 200,
          ),
          Container(
            height: 200,
            color: AppColors.black.withOpacity(0.2),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, bottom: 40, right: 25),
            child: Text(
              seeMoreType == SeeMoreType.guide
                  ? 'Book your own private local\nGuide and explore the city'
                  : 'Plenty of amazing of tours are waiting for you',
              style: context.textStyle.titleMedium?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white),
            ),
          )
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
                    'Hi, ${seeMoreType == SeeMoreType.tour ? 'where do you want to explore?' : seeMoreType == SeeMoreType.guide ? 'who do you want to choose?' : 'which news do you want to read?'}'),
          )),
    );
  }
}
