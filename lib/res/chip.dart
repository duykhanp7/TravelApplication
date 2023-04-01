import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';

class AppListChipWidget extends StatelessWidget {
  const AppListChipWidget({super.key, required this.chips});
  final List<String> chips;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
            chips.length,
            (index) => AppChip(
                  chip: chips[index],
                )),
      ),
    );
  }
}

class AppChip extends StatelessWidget {
  const AppChip({super.key, required this.chip, this.width});
  final String chip;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 3),
      padding: const EdgeInsets.fromLTRB(6, 3, 6, 3),
      alignment: Alignment.center,
      height: 20,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: AppColors.chipBg),
      child: Text(
        chip,
        style: context.textStyle.titleSmall?.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.inActiveRadioBorderColor),
      ),
    );
  }
}
