import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';

import '../../../res/colors.dart';
import '../../../res/images.dart';

class TravelNewItem extends StatefulWidget {
  const TravelNewItem({super.key, required this.callback});

  final VoidCallback callback;

  @override
  State<StatefulWidget> createState() {
    return _TravelNewItem();
  }
}

class _TravelNewItem extends State<TravelNewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.only(top: 10, left: 5),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Destination in Da Nang City',
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Frb 5, 2023',
                  style: context.textStyle.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSkipColor),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 7,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AppImages.cungVanHoaThieuNhi,
                    filterQuality: FilterQuality.high,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              alignment: Alignment.center,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  highlightColor: AppColors.white.withOpacity(0.1),
                  splashColor: AppColors.white.withOpacity(0.1),
                  child: Container(
                    alignment: Alignment.center,
                    height: 190,
                    width: MediaQuery.of(context).size.width,
                  ),
                  onTap: () {},
                ),
              ),
            )
          ],
        ));
  }
}