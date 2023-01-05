import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/images.dart';
import 'package:travel_booking_tour/res/star/vertical_star_widget.dart';

class JourneyItem extends StatefulWidget {
  const JourneyItem({super.key, required this.rating, required this.callback});
  final int rating;
  final VoidCallback callback;
  @override
  State<StatefulWidget> createState() {
    return _JourneyItem();
  }
}

class _JourneyItem extends State<JourneyItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      borderOnForeground: true,
      semanticContainer: true,
      child: Container(
        width: 235,
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
                          decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: Image.asset(
                              AppImages.daNangBanaHoiAn,
                              filterQuality: FilterQuality.high,
                              width: 235,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 12,
                            top: 12,
                            child: Container(
                              alignment: Alignment.center,
                              width: 13,
                              height: 20,
                              color: AppColors.transparent,
                              child: Material(
                                color: AppColors.transparent,
                                child: InkWell(
                                  child:
                                      SvgPicture.asset(AppIcons.favoriteNone),
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: 10,
                            left: 12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                VerticalStarWidget(rating: widget.rating),
                                const SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  '1247 likes',
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
                      width: 235,
                      padding:
                          const EdgeInsets.only(top: 10, left: 12, right: 12),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Da Nang - Ba Na - Hoi An',
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle.titleMedium,
                            ),
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
                                'Jan 30, 2023',
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
                                '3 days',
                                style: context.textStyle.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textOnboardingBrown),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '\$400.00',
                              style: context.textStyle.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w100,
                                  color: AppColors.primary,
                                  fontStyle: FontStyle.italic),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              width: 235,
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
            )
          ],
        ),
      ),
    );
  }
}
