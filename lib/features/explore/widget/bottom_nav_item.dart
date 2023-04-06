import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../../res/styles.dart';

class BottomNavItem extends StatefulWidget {
  const BottomNavItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.clicked,
      this.width,
      this.height,
      required this.onClick,
      required this.index});

  final int index;
  final String icon;
  final String title;
  final bool clicked;
  final double? width;
  final double? height;
  final Function(int) onClick;

  @override
  State<StatefulWidget> createState() {
    return _BottomNavItem();
  }
}

class _BottomNavItem extends State<BottomNavItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 50,
      color: AppColors.transparent,
      width: MediaQuery.of(context).size.width / 5,
      alignment: Alignment.center,
      child: Material(
          color: AppColors.transparent,
          child: InkWell(
            splashColor: AppColors.white.withOpacity(0.1),
            highlightColor: AppColors.textSkipColor.withOpacity(0.1),
            child: Container(
              color: AppColors.transparent,
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: SvgPicture.asset(
                      widget.icon,
                      width: widget.width ?? 30,
                      height: widget.height ?? 28,
                      color: widget.clicked
                          ? AppColors.primary
                          : AppColors.underLineTextFieldColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.clicked ? widget.title : '',
                    style: AppStyles.titleSmall.copyWith(
                        fontSize: 10,
                        color: widget.clicked
                            ? AppColors.primary
                            : AppColors.underLineTextFieldColor),
                  )
                ],
              ),
            ),
            onTap: () {
              widget.onClick(widget.index);
            },
          )),
    );
  }
}
