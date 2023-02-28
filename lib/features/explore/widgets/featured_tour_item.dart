import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/explore/models/feature_tour_preview_json.dart';

import '../../../res/colors.dart';
import '../../../res/icons.dart';
import '../../../res/images.dart';
import '../../../res/vertical_star_widget.dart';

class FeaturedTourItem extends StatefulWidget {
  const FeaturedTourItem({
    super.key,
    required this.callback,
    required this.featureTourJson,
  });
  final VoidCallback callback;
  final FeatureTourJson featureTourJson;
  @override
  State<StatefulWidget> createState() {
    return _FeaturedTourItem();
  }
}

class _FeaturedTourItem extends State<FeaturedTourItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      borderOnForeground: true,
      semanticContainer: true,
      child: Container(
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.white),
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Image.asset(
                              AppImages.daNangBanaHoiAn1,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            left: 12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HorizontalStarWidget(
                                    rating:
                                        widget.featureTourJson.ratings ?? 0),
                                const SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  '${widget.featureTourJson.likes} likes',
                                  style: context.textStyle.titleSmall?.copyWith(
                                      fontSize: 12,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ))
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.featureTourJson.address ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyle.titleMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppIcons.calendarWhite,
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                widget.featureTourJson.dateStart ??
                                    '00-00-0000',
                                style: context.textStyle.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textOnboardingBrown),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppIcons.clock,
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                '${widget.featureTourJson.quantities} days',
                                style: context.textStyle.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textOnboardingBrown),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$${widget.featureTourJson.prices ?? 0}',
                                  style: context.textStyle.titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w100,
                                          color: AppColors.primary,
                                          fontStyle: FontStyle.italic),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              decoration: const BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              alignment: Alignment.center,
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: AppColors.transparent,
                child: InkWell(
                  highlightColor: AppColors.white.withOpacity(0.1),
                  splashColor: AppColors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  onTap: widget.callback,
                ),
              ),
            ),
            Positioned(
                right: 12,
                top: 12,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 13,
                      height: 20,
                      color: AppColors.transparent,
                      child: SvgPicture.asset(AppIcons.bookMarkNone),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: AppColors.transparent,
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.transparent,
                        child: InkWell(
                          splashColor: AppColors.white.withOpacity(0.2),
                          highlightColor: AppColors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onTap: () {},
                        ),
                      ),
                    )
                  ],
                )),
            Positioned(
                right: 12,
                top: 40,
                bottom: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(AppIcons.favoriteNone),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: Material(
                          color: AppColors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            splashColor:
                                AppColors.textSkipColor.withOpacity(0.1),
                            highlightColor:
                                AppColors.textSkipColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onTap: () {},
                          )),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
