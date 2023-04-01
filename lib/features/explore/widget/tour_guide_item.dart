import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/tour_guide_detail_json.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

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
                          child: Image.asset(
                            widget.tourGuideDetailJson.profileImageUrl ?? '',
                            width: 220,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            bottom: 7,
                            left: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HorizontalStarWidget(
                                    rating:
                                        widget.tourGuideDetailJson.rating ?? 0),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${widget.tourGuideDetailJson.reviews?.length ?? 0} reviews',
                                    textAlign: TextAlign.start,
                                    style: context.textStyle.titleSmall
                                        ?.copyWith(
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
                            widget.tourGuideDetailJson.name ?? '',
                            style: context.textStyle.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
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
                                  widget.tourGuideDetailJson.address ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyle.titleSmall?.copyWith(
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
