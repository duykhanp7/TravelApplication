import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'colors.dart';

class AppInkWell extends StatefulWidget {
  const AppInkWell(
      {super.key,
      this.size,
      required this.voidCallBack,
      required this.icon,
      this.background,
      this.iconTint,
      this.iconSize});

  final Size? size;
  final Size? iconSize;
  final VoidCallback voidCallBack;
  final String icon;
  final Color? background;
  final Color? iconTint;

  @override
  State<StatefulWidget> createState() {
    return _AppInkWell();
  }
}

class _AppInkWell extends State<AppInkWell> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: widget.size?.width ?? 40,
          height: widget.size?.height ?? 40,
          decoration: BoxDecoration(
              color: widget.background ?? AppColors.black.withOpacity(0.1),
              borderRadius:
                  BorderRadius.circular((widget.size?.width ?? 40) / 2)),
        ),
        SvgPicture.asset(widget.icon,
            color: widget.iconTint,
            width: widget.iconSize?.width,
            height: widget.iconSize?.height),
        Container(
          width: widget.size?.width ?? 40,
          height: widget.size?.height ?? 40,
          decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius:
                  BorderRadius.circular((widget.size?.width ?? 40) / 2)),
          child: Material(
            borderRadius: BorderRadius.circular((widget.size?.width ?? 40) / 2),
            color: AppColors.transparent,
            child: InkWell(
              borderRadius:
                  BorderRadius.circular((widget.size?.width ?? 40) / 2),
              splashColor: AppColors.black.withOpacity(0.1),
              highlightColor: AppColors.black.withOpacity(0.1),
              onTap: widget.voidCallBack,
            ),
          ),
        )
      ],
    );
  }
}
