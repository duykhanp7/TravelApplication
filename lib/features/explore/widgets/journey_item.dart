import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/features/explore/model/top_journey.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/star/vertical_star_widget.dart';

class JourneyItem extends StatefulWidget {
  const JourneyItem(
      {super.key, required this.callback, required this.journeyJson});
  final VoidCallback callback;
  final TopJourneyJson journeyJson;
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
                              widget.journeyJson.imageUrl ?? '',
                              filterQuality: FilterQuality.high,
                              width: 235,
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
                                VerticalStarWidget(
                                    rating: widget.journeyJson.ratings ?? 0),
                                const SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  '${widget.journeyJson.likes} likes',
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
                              widget.journeyJson.destinationTitle ?? '',
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyle.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
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
                                widget.journeyJson.dateStart ?? '',
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
                                '${widget.journeyJson.quantities} days',
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
                              '\$${widget.journeyJson.price}',
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
                      width: 40,
                      height: 40,
                      color: AppColors.transparent,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.transparent,
                        child: InkWell(
                          splashColor: AppColors.white.withOpacity(0.1),
                          highlightColor: AppColors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onTap: () {
                            debugPrint('On Book Mark Click');
                          },
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
