import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/review_json.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

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
                child: Image.asset(
                  widget.reviewJson?.ratersImage ?? '',
                  width: 50,
                  height: 50,
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
                    style: context.textStyle.titleMedium?.copyWith(
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
                        style: context.textStyle.titleSmall?.copyWith(
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
            style: context.textStyle.titleMedium?.copyWith(
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
