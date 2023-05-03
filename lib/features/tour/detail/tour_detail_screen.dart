import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/features/auth/signup/widget/choose_date_widget.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_event.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_screen.dart';
import 'package:travel_booking_tour/features/tour/detail/bloc/bloc_tour_detail_state.dart';
import 'package:travel_booking_tour/features/tour/detail/widget/schedule_point.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/button.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

import '../../../common/app_constant.dart';
import '../../../data/model/schedule_json.dart';
import '../../../data/model/tour_detail_json.dart';
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
    _tourDetailJson = datas[AppConstant.data] as TourDetailJson;
    _blocTourDetailScreen.add(BlocTourDetailEventInitial());

    return Scaffold(
      appBar: AppbarApp(
        background: AppColors.transparent,
        prefixWidget: AppInkWell(
            voidCallBack: () => Routes.backTo(),
            icon: AppIcons.icBack,
            background: AppColors.transparent),
        suffixWidget: BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
          buildWhen: (previous, current) =>
              current is BlocTourDetailStateLoading,
          builder: (context, state) => _buildWidgetShareAndActions(state),
        ),
        height: 200,
        flexibleSpace: BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
          buildWhen: (previous, current) =>
              current is BlocTourDetailStateLoading,
          builder: (context, state) {
            if (state is BlocTourDetailStateLoading) {
              if (state.appResult.state == ResultState.loading) {
                return Container(
                  alignment: Alignment.center,
                  color: AppColors.black.withOpacity(0.1),
                  child: const AppLayoutShimmer(),
                );
              } else if (state.appResult.state == ResultState.success) {
                return _buildImageSlider(_tourDetailJson.images ?? []);
              }
            }
            return Container();
          },
        ),
      ),
      backgroundColor: AppColors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          if (!_blocTourDetailScreen.isLoading) {
            _blocTourDetailScreen.add(BlocTourDetailEventInitial());
          }
          return;
        },
        child: BlocListener<BlocTourDetailScreen, BlocTourDetailState>(
          listenWhen: (previous, current) =>
              current is BlocTourDetailStateShowBottomSheetShare,
          listener: (context, state) async {
            if (state is BlocTourDetailStateShowBottomSheetShare) {
              await context.showBottomSheetShare();
            }
          },
          child: BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
            buildWhen: (previous, current) =>
                current is BlocTourDetailStateLoading,
            builder: (context, state) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  color: AppColors.white,
                  child: _buildbody(state),
                ),
              );
            },
          ),
        ),
      ),
      extendBodyBehindAppBar: false,
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
        child: BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
          buildWhen: (previous, current) =>
              current is BlocTourDetailStateLoading ||
              current is BlocTourDetailStateBookThisTourResult,
          builder: (context, state) {
            bool isLoading = false;
            if (state is BlocTourDetailStateLoading) {
              if (state.appResult.state == ResultState.loading) {
                isLoading = true;
              } else if (state.appResult.state == ResultState.success ||
                  state.appResult.state == ResultState.fail ||
                  state.appResult.state == ResultState.error) {
                isLoading = false;
              }
            } else if (state is BlocTourDetailStateBookThisTourResult) {
              if (state.appResult.state == ResultState.loading) {
                isLoading = true;
              } else if (state.appResult.state == ResultState.success ||
                  state.appResult.state == ResultState.fail ||
                  state.appResult.state == ResultState.error) {
                isLoading = false;
              }
            }
            return PrimaryActiveButton(
              margin: EdgeInsets.zero,
              text: 'Book this tour',
              onTap: () => _blocTourDetailScreen
                  .add(BlocTourDetailEventClickButtonBookThisTour()),
              isLoading: isLoading,
              allCaps: true,
            );
          },
        ),
      ),
      extendBody: true,
    );
  }

  Widget _buildWidgetShareAndActions(BlocTourDetailState state) {
    if (state is BlocTourDetailStateLoading) {
      if (state.appResult.state == ResultState.loading) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Center(
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 150,
              child: AppLayoutShimmer(
                visibilityLoading: false,
                borderRadius: 5,
                background: AppColors.black.withOpacity(0.1),
              ),
            ),
          ),
        );
      } else if (state.appResult.state == ResultState.success) {
        return Container(
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
              AppButtonFavorite(
                isFavorite: _tourDetailJson.isFavorite ?? false,
                onClick: (value) {},
              ),
              const SizedBox(width: 14),
              AppButtonBookmark(
                iconSize: const Size(17, 17),
                isBookmark: _tourDetailJson.isBookMarked ?? false,
                onClick: (value) {},
              )
            ],
          ),
        );
      }
    }
    return const AppLayoutShimmer();
  }

  Widget _buildImageSlider(List<String> images) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          CarouselSlider(
              items: images
                  .map((e) => CachedNetworkImage(
                        imageUrl: e,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                        fadeInCurve: Curves.linearToEaseOut,
                        fadeOutCurve: Curves.bounceInOut,
                        errorWidget: (context, url, error) =>
                            SvgPicture.asset(AppIcons.icErrorImage),
                        placeholder: (context, url) => const AppLayoutShimmer(),
                      ))
                  .toList(),
              options: CarouselOptions(
                autoPlayCurve: Curves.linearToEaseOut,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 3),
                scrollPhysics: const BouncingScrollPhysics(),
                height: double.infinity,
                onPageChanged: (index, reason) {
                  _blocTourDetailScreen.add(
                      BlocTourDetailEventChangeIndexImageSlider(index: index));
                },
              )),
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

  Widget _buildBodyHeader(BlocTourDetailState state) {
    if (state is BlocTourDetailStateLoading) {
      if (state.appResult.state == ResultState.loading) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            child: AppLayoutShimmer(
              visibilityLoading: false,
              borderRadius: 5,
              background: AppColors.black.withOpacity(0.1),
            ),
          ),
        );
      } else if (state.appResult.state == ResultState.success) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _tourDetailJson.destination ?? '',
                  style: AppStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: AppColors.black),
                ),
                Text('\$${_tourDetailJson.price ?? 0}',
                    style: AppStyles.titleMedium.copyWith(
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
                      style: AppStyles.titleSmall.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textHintColor),
                    )
                  ],
                ),
                Text(
                  '\$${_tourDetailJson.saleOff}',
                  style: AppStyles.titleSmall.copyWith(
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
                  style: AppStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textByAgreeColor),
                ),
                const SizedBox(width: 24),
                Text(_tourDetailJson.provider?.name ?? '',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w500, color: AppColors.primary))
              ],
            )
          ],
        );
      }
    }
    return const AppLayoutShimmer();
  }

  Widget _buildbodyCenter(BlocTourDetailState state) {
    if (state is BlocTourDetailStateLoading) {
      if (state.appResult.state == ResultState.loading) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: 300,
            width: double.infinity,
            child: AppLayoutShimmer(
              visibilityLoading: false,
              borderRadius: 5,
              background: AppColors.black.withOpacity(0.1),
            ),
          ),
        );
      } else if (state.appResult.state == ResultState.success) {
        return Container(
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
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.black)),
                const SizedBox(height: 15),
                Text('Itinerary',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textByAgreeColor)),
                const SizedBox(height: 4),
                Text(_tourDetailJson.destination ?? '',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textOnboardingBlack)),
                const SizedBox(height: 14),
                Text('Duration',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textByAgreeColor)),
                const SizedBox(height: 4),
                Text(_tourDetailJson.duration ?? '',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textOnboardingBlack)),
                const SizedBox(height: 14),
                Text('Departure date',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textByAgreeColor)),
                const SizedBox(height: 4),
                Text(_tourDetailJson.departureDate ?? '',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textOnboardingBlack)),
                const SizedBox(height: 14),
                Text('Departure place',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.textByAgreeColor)),
                const SizedBox(height: 4),
                Text(_tourDetailJson.departurePlace ?? '',
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textOnboardingBlack)),
              ],
            ),
          ),
        );
      }
    }
    return const AppLayoutShimmer();
  }

  Widget _buildbody(BlocTourDetailState state) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 50),
      child: Column(
        children: [
          _buildBodyHeader(state),
          const SizedBox(height: 20),
          _buildbodyCenter(state),
          const SizedBox(height: 20),
          _buildScheduleWidget(state)
        ],
      ),
    );
  }

  Widget _buildScheduleWidget(BlocTourDetailState state) {
    if (state is BlocTourDetailStateLoading) {
      if (state.appResult.state == ResultState.loading) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            height: 500,
            width: double.infinity,
            child: AppLayoutShimmer(
              visibilityLoading: false,
              borderRadius: 5,
              background: AppColors.black.withOpacity(0.1),
            ),
          ),
        );
      } else if (state.appResult.state == ResultState.success) {
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
                    style: AppStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.black))
              ],
            ),
            const SizedBox(height: 21),
            BlocBuilder<BlocTourDetailScreen, BlocTourDetailState>(
              buildWhen: (previous, current) =>
                  current is BlocTourDetailStateChangeIndexSchedule ||
                  current is BlocTourDetailStateLoading,
              builder: (context, state) {
                int index = 0;
                if (state is BlocTourDetailStateChangeIndexSchedule) {
                  index = state.index;
                }
                ScheduleJson? scheduleJson = _tourDetailJson.schedule?[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChooseDateWidget(
                      current: index,
                      dates: List.generate(
                          _tourDetailJson.schedule?.length ?? 0,
                          (index) => 'Day ${index + 1}'),
                      onClick: (index) {
                        _blocTourDetailScreen.add(
                            BlocTourDetailEventChangeIndexSchedule(
                                index: index));
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(scheduleJson?.name ?? 'No departure palace',
                        style: AppStyles.titleMedium.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    const SizedBox(height: 14),
                    ListView.builder(
                      itemCount: scheduleJson?.schedules?.length ?? 0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => DestinationPoint(
                        time: scheduleJson?.schedules?[index].time ?? '',
                        description: index == 0
                            ? 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled.'
                            : 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.',
                      ),
                    )
                  ],
                );
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
                        style: AppStyles.titleMedium.copyWith(
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
    return const AppLayoutShimmer();
  }
}
