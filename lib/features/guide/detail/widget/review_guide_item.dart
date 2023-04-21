import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

import '../../../../data/model/review_json.dart';
import '../../../../res/app_layout_shimmer.dart';
import '../../../../res/icons.dart';
import '../../../../res/styles.dart';

class ReviewGuideItem extends StatefulWidget {
  const ReviewGuideItem({super.key, required this.reviewJson});

  final ReviewJson? reviewJson;

  @override
  State<StatefulWidget> createState() {
    return _ReviewGuideItem();
  }
}

class _ReviewGuideItem extends State<ReviewGuideItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  imageUrl: widget.reviewJson?.ratersImage ?? '',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                  fadeInCurve: Curves.linearToEaseOut,
                  fadeOutCurve: Curves.bounceInOut,
                  errorWidget: (context, url, error) =>
                      SvgPicture.asset(AppIcons.icErrorImage),
                  placeholder: (context, url) => const AppLayoutShimmer(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.reviewJson?.ratersName ?? '',
                    textAlign: TextAlign.left,
                    style: AppStyles.titleMedium.copyWith(
                        color: AppColors.blackDefault,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Row(
                    children: [
                      HorizontalStarWidget(
                          rating: widget.reviewJson?.rating ?? 5),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        widget.reviewJson?.createdAt ?? '',
                        style: AppStyles.titleSmall.copyWith(
                            fontSize: 12,
                            color: AppColors.textByAgreeColor,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            widget.reviewJson?.content ?? '',
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.titleMedium.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.3,
                color: AppColors.black),
          )
        ],
      ),
    );
  }
}
