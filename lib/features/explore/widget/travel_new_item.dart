import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/tour_detail_json.dart';

import '../../../res/colors.dart';

class TravelNewItem extends StatefulWidget {
  const TravelNewItem(
      {super.key, required this.callback, required this.tourDetailJson});

  final VoidCallback callback;
  final TourDetailJson tourDetailJson;

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
                  widget.tourDetailJson.destination ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyle.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.tourDetailJson.departureDate ?? '',
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
                    widget.tourDetailJson.images?[0] ?? '',
                    filterQuality: FilterQuality.high,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    height: 150,
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
                  onTap: widget.callback,
                  child: Container(
                    alignment: Alignment.center,
                    height: 190,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
