import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/images.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

class TourGuideItem extends StatefulWidget {
  const TourGuideItem({super.key, required this.callback});

  final VoidCallback callback;

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
                            AppImages.emmy,
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
                                const HorizontalStarWidget(rating: 5),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '127 reviews',
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
                            'Emmy',
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
                                  'Da Nang, Viet Nam',
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
            Container(
              width: 170,
              height: 220,
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
            )
          ],
        ));
  }
}
