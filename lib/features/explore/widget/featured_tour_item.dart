import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../../data/model/tour_detail_json.dart';

import '../../../res/vertical_star_widget.dart';

class FeaturedTourItem extends StatefulWidget {
  const FeaturedTourItem({
    super.key,
    required this.callback,
    required this.tourDetailJson,
  });
  final VoidCallback callback;
  final TourDetailJson tourDetailJson;
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
                    flex: 2,
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: CachedNetworkImage(
                              imageUrl: widget.tourDetailJson.images?[0] ?? '',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              height: 150,
                              fadeInCurve: Curves.linearToEaseOut,
                              fadeOutCurve: Curves.bounceInOut,
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(AppIcons.icErrorImage),
                              placeholder: (context, url) =>
                                  const AppLayoutShimmer(),
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
                                    rating: widget.tourDetailJson.rating ?? 0),
                                const SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  '${widget.tourDetailJson.likes} likes',
                                  style: AppStyles.titleSmall.copyWith(
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
                                  widget.tourDetailJson.destination ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.titleMedium
                                      .copyWith(fontWeight: FontWeight.w500),
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
                                widget.tourDetailJson.departureDate ??
                                    '00-00-0000',
                                style: AppStyles.titleSmall.copyWith(
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
                                '${widget.tourDetailJson.schedule?.length ?? 0} days',
                                style: AppStyles.titleSmall.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textOnboardingBrown),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$${widget.tourDetailJson.price ?? 0}',
                                  style: AppStyles.titleMedium.copyWith(
                                      fontWeight: FontWeight.w100,
                                      color: AppColors.primary,
                                      fontStyle: FontStyle.italic),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              width: double.infinity,
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
                child: AppButtonBookmark(
                  size: const Size(30, 30),
                  iconSize: const Size(20, 20),
                  isBookmark: widget.tourDetailJson.isBookMarked ?? false,
                  onClick: (value) {},
                )),
            Positioned(
                right: 12,
                top: 80,
                bottom: 0,
                child: AppButtonFavorite(
                  iconTint: AppColors.primary,
                  background: AppColors.transparent,
                  size: const Size(40, 40),
                  iconSize: const Size(25, 25),
                  isFavorite: widget.tourDetailJson.isFavorite ?? false,
                  onClick: (value) {},
                  iconActive: AppIcons.favoriteFill,
                  iconInActive: AppIcons.favoriteNone,
                )),
          ],
        ),
      ),
    );
  }
}
