import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/tour_detail_json.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

class MyExperienceItem extends StatefulWidget {
  const MyExperienceItem({super.key, required this.tourDetailJson});

  final TourDetailJson? tourDetailJson;

  @override
  State<StatefulWidget> createState() {
    return _MyExperienceItem();
  }
}

class _MyExperienceItem extends State<MyExperienceItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
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
                      Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: Image.asset(
                                widget.tourDetailJson?.images?[0] ?? '',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                height: 202,
                              )),
                          const SizedBox(width: 2),
                          Flexible(
                            flex: 1,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              semanticChildCount: 2,
                              children: [
                                Image.asset(
                                    widget.tourDetailJson?.images?[1] ?? '',
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    height: 100),
                                const SizedBox(height: 2),
                                Image.asset(
                                    widget.tourDetailJson?.images?[2] ?? '',
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    height: 100),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  widget.tourDetailJson?.description ?? '',
                                  textAlign: TextAlign.start,
                                  style: context.textStyle.titleMedium
                                      ?.copyWith(
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
                                  widget.tourDetailJson?.destination ?? '',
                                  style: context.textStyle.titleSmall?.copyWith(
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
                      widget.tourDetailJson?.departureDate ?? '',
                      textAlign: TextAlign.start,
                      style: context.textStyle.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.textSkipColor),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                              AppIcons.favoriteNone,
                              width: 20,
                              height: 20,
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Material(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.transparent,
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      alignment: Alignment.center,
                                    ),
                                    onTap: () {}
                                    //On Tap Icon Favorite,
                                    ),
                              ),
                            )
                          ],
                        ),
                        Text('${widget.tourDetailJson?.likes ?? 0} likes',
                            style: context.textStyle.titleSmall?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: AppColors.textSkipColor))
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
