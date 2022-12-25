import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/icons.dart';

import 'colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.text,
      this.textStyle,
      this.borderRadius,
      this.width,
      this.height,
      this.color,
      this.ripple,
      required this.onTap,
      this.allCaps,
      this.margin});

  final String text;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? ripple;
  final VoidCallback? onTap;
  final bool? allCaps;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    double widthh = MediaQuery.of(context).size.width;
    return Container(
      margin: margin ?? const EdgeInsets.only(left: 33, right: 33),
      width: width ?? widthh,
      height: height ?? 50,
      decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(6))),
      child: Material(
        borderRadius:
            borderRadius ?? const BorderRadius.all(Radius.circular(6)),
        color: AppColors.transparent,
        child: InkWell(
          splashColor: ripple ?? AppColors.buttonRipple,
          borderRadius: borderRadius ?? BorderRadius.circular(6),
          onTap: onTap ?? () {},
          child: Container(
            alignment: Alignment.center,
            child: Text(
              allCaps == false ? text : text.toUpperCase(),
              style: textStyle ??
                  context.textStyle.titleSmall!
                      .copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key,
      required this.icon,
      required this.background,
      required this.splash,
      required this.voidCallback,
      this.width,
      this.height,
      this.radius});

  final String icon;
  final Color background;
  final Color splash;
  final VoidCallback voidCallback;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width ?? 40,
      height: height ?? 40,
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(radius ?? 7)),
      child: Material(
        borderRadius: BorderRadius.circular(radius ?? 7),
        color: AppColors.transparent,
        child: InkWell(
          splashColor: splash,
          borderRadius: BorderRadius.circular(radius ?? 7),
          onTap: voidCallback,
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
