import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/res.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

import '../../../data/model/tour_guide_detail_json.dart';

class TourGuideItem extends StatefulWidget {
  const TourGuideItem(
      {super.key, required this.callback, required this.tourGuideDetailJson});

  final VoidCallback callback;
  final TourGuideDetailJson tourGuideDetailJson;

  @override
  State<StatefulWidget> createState() {
    return _TourGuideItem();
  }
}

class _TourGuideItem extends State<TourGuideItem> {
  @override
  Widget build(BuildContext context) {
    debugPrint(
        '_TourGuideItem : ${widget.tourGuideDetailJson.attributes?.user?.data?.attributes?.avatar?.data?.attributes?.url}');
    return Container(
        width: 170,
        height: 220,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                    flex: 3,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          child: CachedNetworkImage(
                            imageUrl: widget
                                    .tourGuideDetailJson
                                    .attributes
                                    ?.user
                                    ?.data
                                    ?.attributes
                                    ?.avatar
                                    ?.data
                                    ?.attributes
                                    ?.url ??
                                '',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            width: 220,
                            height: 170,
                            fadeInCurve: Curves.linearToEaseOut,
                            fadeOutCurve: Curves.bounceInOut,
                            errorWidget: (context, url, error) =>
                                SvgPicture.asset(AppIcons.icErrorImage),
                            placeholder: (context, url) =>
                                const AppLayoutShimmer(),
                          ),
                        ),
                        Positioned(
                            bottom: 7,
                            left: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const HorizontalStarWidget(rating: 5),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${0} reviews',
                                    textAlign: TextAlign.start,
                                    style: AppStyles.titleSmall.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            (widget.tourGuideDetailJson.attributes?.user?.data
                                        ?.attributes?.lastName ??
                                    '') +
                                (widget.tourGuideDetailJson.attributes?.user
                                        ?.data?.attributes?.firstName ??
                                    ''),
                            style: AppStyles.titleMedium
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 3),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppIcons.locationGreen),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  '${widget.tourGuideDetailJson.attributes?.city ?? ''}, ${widget.tourGuideDetailJson.attributes?.user?.data?.attributes?.country ?? ''}',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.titleSmall.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primary),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
            AspectRatio(
              aspectRatio: 1 / 1.35,
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                alignment: Alignment.center,
                child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: AppColors.transparent,
                  child: InkWell(
                    highlightColor: AppColors.white.withOpacity(0.1),
                    splashColor: AppColors.white.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    onTap: widget.callback,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
