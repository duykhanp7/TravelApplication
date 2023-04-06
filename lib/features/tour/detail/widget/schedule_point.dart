import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../../../res/styles.dart';

class DestinationPoint extends StatefulWidget {
  const DestinationPoint(
      {super.key, required this.time, required this.description});

  final String time;
  final String description;

  @override
  State<StatefulWidget> createState() {
    return _DestinationPoint();
  }
}

class _DestinationPoint extends State<DestinationPoint> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: AppColors.timeLineIndicator.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: AppColors.timeLineIndicator,
                        borderRadius: BorderRadius.circular(4)),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Text(widget.time,
                  style: AppStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w500, color: AppColors.primary))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              widget.description,
              style: AppStyles.titleMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: AppColors.textOnboardingBrown),
            ),
          )
        ],
      ),
    );
  }
}
