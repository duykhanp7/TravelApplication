import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extension/app_extensions.dart';
import 'package:travel_booking_tour/data/dio/api_client.dart';
import 'package:travel_booking_tour/features/profile/model/photo_json.dart';
import 'package:travel_booking_tour/res/app_button_favorite.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

import '../../../../data/model/my_experience_json.dart';
import '../../../../res/app_layout_shimmer.dart';
import '../../../../res/styles.dart';

class MyExperienceItem extends StatefulWidget {
  const MyExperienceItem(
      {super.key, required this.myExperienceJson, required this.edited});

  final MyExperienceJson? myExperienceJson;
  final bool edited;

  @override
  State<StatefulWidget> createState() {
    return _MyExperienceItem();
  }
}

class _MyExperienceItem extends State<MyExperienceItem> {
  MyExperienceJson? myExperienceJson;

  @override
  void initState() {
    myExperienceJson = widget.myExperienceJson;
    super.initState();
  }

  final ApiService _apiService = ApiService();

  Future<MyExperienceJson?> getDetailMyExperience(int? id) async {
    return await _apiService.getJson(
      endPoint: '/api/journeys/$id',
      queryParams: {'populate': '*'},
      converter: (data) {
        final multi = data['data']['attributes']['multi']['data'];
        List<PhotoJson>? photos;
        if (multi is Iterable) {
          photos =
              multi.map((e) => PhotoJson.fromJson(e['attributes'])).toList();
        }
        return myExperienceJson?.copyWith(multi: photos ?? []);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDetailMyExperience(myExperienceJson?.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.brown),
            height: 305,
            child: const AppLayoutShimmer(),
          );
        }
        if (snapshot.hasData) {
          myExperienceJson = snapshot.data;
          return Stack(
            children: [
              SizedBox(
                child: Card(
                  elevation: 5,
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          _buildImages(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(myExperienceJson?.name ?? '',
                                      textAlign: TextAlign.start,
                                      style: AppStyles.titleMedium.copyWith(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.locationGreen),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      myExperienceJson?.location ?? '',
                                      style: AppStyles.titleSmall.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: AppColors.primary),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: AppColors.transparent,
                height: 305,
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.transparent,
                  child: InkWell(
                    highlightColor: AppColors.white.withOpacity(0.2),
                    splashColor: AppColors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      //On Tap Item
                    },
                  ),
                ),
              ),
              Positioned(
                  left: 16,
                  right: 16,
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          myExperienceJson?.createdAt?.toyMMMdFormat() ?? '',
                          textAlign: TextAlign.start,
                          style: AppStyles.titleSmall.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.textSkipColor),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            AppButtonFavorite(
                              isFavorite: false,
                              background: AppColors.transparent,
                              iconTint: AppColors.primary,
                              size: const Size(30, 30),
                              iconSize: const Size(20, 20),
                              onClick: (value) {},
                            ),
                            const SizedBox(width: 13),
                            Text('${0} likes',
                                style: AppStyles.titleSmall.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.textSkipColor))
                          ],
                        ),
                      )
                    ],
                  )),
              Visibility(
                  visible: widget.edited,
                  child: Positioned(
                      right: 16,
                      bottom: 80,
                      child: Material(
                        color: AppColors.transparent,
                        child: InkWell(
                          splashColor: AppColors.black.withOpacity(0.1),
                          highlightColor: AppColors.black.withOpacity(0.1),
                          onTap: () {},
                          child: Container(
                            color: AppColors.transparent,
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              AppIcons.icMoreTransparent,
                            ),
                          ),
                        ),
                      )))
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget _buildImages() {
    if (myExperienceJson?.multi?.isNotEmpty ?? false) {
      int imageLength = myExperienceJson!.multi!.length;
      if (imageLength == 1) {
        return CachedNetworkImage(
            imageUrl: myExperienceJson?.multi?[0].url ?? '',
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            height: 202,
            width: double.infinity,
            fadeInCurve: Curves.linearToEaseOut,
            fadeOutCurve: Curves.bounceInOut,
            errorWidget: (context, url, error) =>
                SvgPicture.asset(AppIcons.icErrorImage),
            placeholder: (context, url) => const AppLayoutShimmer());
      } else if (imageLength == 2) {
        return Row(
          children: [
            Flexible(
                flex: 1,
                child: CachedNetworkImage(
                    imageUrl: myExperienceJson?.multi?[0].url ?? '',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: 202,
                    width: double.infinity,
                    fadeInCurve: Curves.linearToEaseOut,
                    fadeOutCurve: Curves.bounceInOut,
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppIcons.icErrorImage),
                    placeholder: (context, url) => const AppLayoutShimmer())),
            const SizedBox(width: 2),
            Flexible(
                flex: 1,
                child: CachedNetworkImage(
                    imageUrl: myExperienceJson?.multi?[1].url ?? '',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: 202,
                    width: double.infinity,
                    fadeInCurve: Curves.linearToEaseOut,
                    fadeOutCurve: Curves.bounceInOut,
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppIcons.icErrorImage),
                    placeholder: (context, url) => const AppLayoutShimmer()))
          ],
        );
      }
      return Row(
        children: [
          Flexible(
              flex: 1,
              child: CachedNetworkImage(
                  imageUrl: myExperienceJson?.multi?[0].url ?? '',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  height: 202,
                  width: double.infinity,
                  fadeInCurve: Curves.linearToEaseOut,
                  fadeOutCurve: Curves.bounceInOut,
                  errorWidget: (context, url, error) =>
                      SvgPicture.asset(AppIcons.icErrorImage),
                  placeholder: (context, url) => const AppLayoutShimmer())),
          const SizedBox(width: 2),
          Flexible(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              semanticChildCount: 2,
              children: [
                CachedNetworkImage(
                    imageUrl: myExperienceJson?.multi?[1].url ?? '',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity,
                    fadeInCurve: Curves.linearToEaseOut,
                    fadeOutCurve: Curves.bounceInOut,
                    errorWidget: (context, url, error) =>
                        SvgPicture.asset(AppIcons.icErrorImage),
                    placeholder: (context, url) => const AppLayoutShimmer()),
                const SizedBox(height: 2),
                imageLength == 3
                    ? CachedNetworkImage(
                        imageUrl: myExperienceJson?.multi?[2].url ?? '',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                        height: 100,
                        width: double.infinity,
                        fadeInCurve: Curves.linearToEaseOut,
                        fadeOutCurve: Curves.bounceInOut,
                        errorWidget: (context, url, error) =>
                            SvgPicture.asset(AppIcons.icErrorImage),
                        placeholder: (context, url) => const AppLayoutShimmer())
                    : Stack(
                        children: [
                          CachedNetworkImage(
                              imageUrl: myExperienceJson?.multi?[2].url ?? '',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              height: 100,
                              width: double.infinity,
                              fadeInCurve: Curves.linearToEaseOut,
                              fadeOutCurve: Curves.bounceInOut,
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(AppIcons.icErrorImage),
                              placeholder: (context, url) =>
                                  const AppLayoutShimmer()),
                          Container(
                            alignment: Alignment.center,
                            color: AppColors.black.withOpacity(0.6),
                            height: 100,
                            child: Text(
                              '+${imageLength - 3}',
                              style: AppStyles.titleMedium
                                  .copyWith(color: AppColors.white),
                            ),
                          )
                        ],
                      ),
              ],
            ),
          )
        ],
      );
    }
    return Container();
  }
}
