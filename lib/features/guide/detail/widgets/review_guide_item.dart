import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/images.dart';
import 'package:travel_booking_tour/res/vertical_star_widget.dart';

class ReviewGuideItem extends StatefulWidget {
  const ReviewGuideItem({super.key});

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
                  AppImages.emmy,
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
                    'Pena valdez',
                    textAlign: TextAlign.left,
                    style: context.textStyle.titleMedium?.copyWith(
                        color: AppColors.blackDefault,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  Row(
                    children: [
                      const HorizontalStarWidget(rating: 5),
                      const SizedBox(
                        width: 25,
                      ),
                      Text(
                        'Jan 22, 2022',
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
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.',
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
