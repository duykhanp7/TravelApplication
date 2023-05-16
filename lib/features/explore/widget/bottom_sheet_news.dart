import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/common/extension/extenstion.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/data/model/news_json.dart';
import 'package:travel_booking_tour/features/explore/bloc/bloc_explore_screen.dart';
import 'package:travel_booking_tour/features/explore/widget/comment_widget.dart';
import 'package:travel_booking_tour/features/explore/widget/travel_new_item.dart';
import 'package:travel_booking_tour/res/app_inkwell.dart';
import 'package:travel_booking_tour/res/input_field.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../router/routes.dart';
import '../bloc/bloc_explore_event.dart';
import '../bloc/bloc_explore_state.dart';

class BottomSheetNews extends StatefulWidget {
  const BottomSheetNews({super.key, required this.newsJson});

  final NewsJson newsJson;

  @override
  State<StatefulWidget> createState() {
    return _BottomSheetNews();
  }
}

class _BottomSheetNews extends State<BottomSheetNews> {
  @override
  void initState() {
    newJson = widget.newsJson;
    BlocProvider.of<BlocExploreScreen>(context)
        .add(BlocExploreEventLoadDetailNews(newsJson: widget.newsJson));
    super.initState();
  }

  NewsJson? newJson;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocExploreScreen, BlocExploreState>(
      buildWhen: (previous, current) =>
          current is BlocExploreStateLoadDetailNewsData,
      builder: (context, state) {
        if (state is BlocExploreStateLoadDetailNewsData) {
          if (state.appResult.state == ResultState.success) {
            NewsJson result = state.appResult.result as NewsJson;
            newJson = result;
          }
        }
        return Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppbarApp(
              background: AppColors.transparent, prefixWidget: Container()),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              color: AppColors.transparent,
              child: Stack(
                children: [_buildBody(state), _buildTopBody(state)],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopBody(BlocExploreState state) {
    if (state is BlocExploreStateLoadDetailNewsData) {
      if (state.appResult.state == ResultState.loading) {
        return Container(
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.bgBLlur,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: const AppLayoutShimmer(),
        );
      }
    }
    return Stack(children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: CachedNetworkImage(
          imageUrl: newJson?.attributes?.images?.data?[0].attributes?.url ??
              'https://i.imgur.com/mL5BwvK.png',
          width: double.infinity,
          height: 220,
          filterQuality: FilterQuality.high,
          placeholder: (context, url) => const AppLayoutShimmer(),
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
          top: 16,
          left: 16,
          child: AppInkWell(
              background: AppColors.transparent,
              voidCallBack: () => Routes.backTo(),
              icon: AppIcons.icClose))
    ]);
  }

  Widget _buildBody(BlocExploreState state) {
    bool isLoading = true;
    if (state is BlocExploreStateLoadDetailNewsData) {
      if (state.appResult.state == ResultState.loading) {
        isLoading = true;
      } else {
        isLoading = false;
      }
    }
    return LayoutBuilder(
        builder: (context, constraint) => Container(
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: isLoading
                      ? const AppLayoutShimmer()
                      : Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            color: AppColors.white,
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 220),
                            child: Column(
                              children: [
                                _buildTopContent(),
                                18.gapHeight,
                                _buildContent(),
                                15.gapHeight,
                                _buildAuthorWidget(),
                                15.gapHeight,
                                _buildBodyContent()
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ));
  }

  Widget _buildBodyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
              '${newJson?.attributes?.description?.replaceAll('"', '')}',
              style: AppStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textRadioItalicColor)),
        ),
        15.gapHeight,
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: newJson?.attributes?.images?.data?[1].attributes?.url ??
                'https://i.imgur.com/mL5BwvK.png',
            width: double.infinity,
            height: 220,
            filterQuality: FilterQuality.high,
            placeholder: (context, url) => const AppLayoutShimmer(),
            fit: BoxFit.cover,
          ),
        ),
        30.gapHeight,
        _buildCommentWidget(),
        30.gapHeight,
        _buildRelatedNews()
      ],
    );
  }

  Future<List<NewsJson>> getListNews(int page) async => ApiService().getJson(
        endPoint: '/api/blogs',
        queryParams: {'populate': '*', 'pagination[page]': page},
        converter: (data) {
          dynamic result = data['data'];
          if (result is Iterable) {
            return result
                .map((e) => NewsJson.fromJson(e))
                .toList()
                .where((element) => element.id != newJson?.id)
                .toList();
          }
          return [];
        },
      );

  Widget _buildRelatedNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Related News',
            style: AppStyles.titleLarge.copyWith(
                fontWeight: FontWeight.w100,
                color: AppColors.black,
                fontStyle: FontStyle.italic)),
        15.gapHeight,
        FutureBuilder(
          future: getListNews(1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  decoration: BoxDecoration(
                      color: AppColors.bgBLlur.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5)),
                  width: double.infinity,
                  height: 200,
                  child: const AppLayoutShimmer());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    snapshot.data != null
                        ? (snapshot.data!.length >= 4
                            ? 4
                            : snapshot.data!.length)
                        : 0,
                    (index) => TravelNewItem(
                        newsJson: snapshot.data![index],
                        callback: () {
                          BlocProvider.of<BlocExploreScreen>(context).add(
                              BlocExploreEventOnNewsClick(
                                  newsJson: snapshot.data![index],
                                  context,
                                  true));
                        })),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }

  Widget _buildCommentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CommentWidget(id: newJson?.id),
        ),
        SizedBox(
          width: double.infinity,
          child: AppTextField(
            maxLines: 5,
            inputDecoration: InputDecoration(
                hintText: 'Add Your Comment',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.brown)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.brown)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(width: 1, color: AppColors.brown))),
          ),
        )
      ],
    );
  }

  Future<dynamic> getAvatarAuthor() async {
    int? id = newJson?.id;
    ApiService apiService = ApiService();
    return await apiService.getJson(
        endPoint: '/api/blogs/$id',
        queryParams: {
          'populate[0]': 'author',
          'populate[1]': 'author.avatar',
        },
        converter: (data) {
          String? url = data['data']['attributes']['author']['data']
              ['attributes']['avatar']['data']['attributes']['url'];
          debugPrint('Avatar Author : $url');
          return url;
        });
  }

  Widget _buildAuthorWidget() {
    return FutureBuilder(
        future: getAvatarAuthor(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(snapshot.data),
                  ),
                ),
                10.gapWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${newJson?.attributes?.author?.data?.attributes?.lastName} ${newJson?.attributes?.author?.data?.attributes?.firstName}',
                      style: AppStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textRadioItalicColor),
                    ),
                    10.gapHeight,
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.calendarWhite,
                              color: AppColors.black),
                          5.gapWidth,
                          Text(
                              '${newJson?.attributes?.createdAt?.toyMMMdFormat()}',
                              style: AppStyles.titleMedium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: AppColors.textByAgreeColor))
                        ])
                  ],
                )
              ],
            );
          }
          return Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.bgBLlur,
                borderRadius: BorderRadius.circular(10)),
          );
        });
  }

  Widget _buildContent() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              '${newJson?.attributes?.title?.replaceAll('"', '').toTitleCase()}',
              style: AppStyles.titleLarge.copyWith(color: AppColors.black),
            ))
          ],
        )
      ],
    );
  }

  Widget _buildTopContent() {
    return Row(
      children: [
        AppButtonFavorite(
            size: const Size(40, 40),
            iconSize: const Size(25, 25),
            background: AppColors.transparent,
            isFavorite: false,
            onClick: (value) {},
            iconTint: AppColors.primary),
        8.gapWidth,
        Text('Like ${newJson?.attributes?.likes?.data?.length}',
            style: AppStyles.labelMedium.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.textByAgreeColor)),
        const Spacer(),
        AppInkWell(
            voidCallBack: () {},
            icon: AppIcons.facebook,
            iconTint: AppColors.textByAgreeColor,
            iconSize: const Size(20, 20),
            background: AppColors.transparent),
        AppInkWell(
            voidCallBack: () {},
            icon: AppIcons.icTwitterFrame,
            iconTint: AppColors.textByAgreeColor,
            iconSize: const Size(20, 20),
            background: AppColors.transparent),
        AppInkWell(
            voidCallBack: () {},
            icon: AppIcons.icTalkBrown,
            iconTint: AppColors.textByAgreeColor,
            iconSize: const Size(20, 20),
            background: AppColors.transparent),
      ],
    );
  }
}
