import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/res/styles.dart';

import 'colors.dart';

class PrimaryActiveButton extends StatefulWidget {
  const PrimaryActiveButton(
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
      this.margin,
      this.isLoading,
      this.icon,
      this.border});

  final String text;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? ripple;
  final VoidCallback onTap;
  final bool? allCaps;
  final EdgeInsetsGeometry? margin;
  final bool? isLoading;
  final Widget? icon;
  final Border? border;

  @override
  State<StatefulWidget> createState() {
    return _PrimaryActiveButton();
  }
}

class _PrimaryActiveButton extends State<PrimaryActiveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(left: 33, right: 33),
      height: widget.height ?? 50,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
          color: widget.color ?? AppColors.primary,
          border: widget.border,
          borderRadius: widget.borderRadius ??
              const BorderRadius.all(Radius.circular(6))),
      child: Material(
        borderRadius:
            widget.borderRadius ?? const BorderRadius.all(Radius.circular(6)),
        color: AppColors.transparent,
        child: InkWell(
          splashColor: widget.ripple ?? AppColors.buttonRipple,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(6),
          onTap: () {
            if (widget.isLoading != null) {
              widget.isLoading! ? () {} : widget.onTap();
              FocusScope.of(context).requestFocus(FocusNode());
            } else {
              widget.onTap();
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: widget.isLoading == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      widget.icon ?? Container(),
                      Text(
                        widget.allCaps == false
                            ? widget.text
                            : widget.text.toUpperCase(),
                        style: widget.textStyle ??
                            AppStyles.titleSmall
                                .copyWith(color: AppColors.white),
                      )
                    ],
                  )
                : widget.isLoading!
                    ? Container(
                        alignment: Alignment.center,
                        width: 26,
                        height: 26,
                        child: const CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          widget.icon ?? Container(),
                          Text(
                            widget.allCaps == false
                                ? widget.text
                                : widget.text.toUpperCase(),
                            style: widget.textStyle ??
                                AppStyles.titleSmall
                                    .copyWith(color: AppColors.white),
                          )
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}

class PrimaryInactiveButton extends StatefulWidget {
  const PrimaryInactiveButton(
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
      this.margin,
      this.isLoading});

  final String text;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? ripple;
  final VoidCallback onTap;
  final bool? allCaps;
  final EdgeInsetsGeometry? margin;
  final bool? isLoading;

  @override
  State<StatefulWidget> createState() {
    return _PrimaryInactiveButton();
  }
}

class _PrimaryInactiveButton extends State<PrimaryInactiveButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.only(left: 33, right: 33),
      height: widget.height ?? 50,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
          color: widget.color ?? AppColors.white,
          border: Border.all(width: 1, color: AppColors.tableBorder),
          borderRadius: widget.borderRadius ??
              const BorderRadius.all(Radius.circular(6))),
      child: Material(
        borderRadius:
            widget.borderRadius ?? const BorderRadius.all(Radius.circular(6)),
        color: AppColors.transparent,
        child: InkWell(
          splashColor: widget.ripple ?? AppColors.black.withOpacity(0.1),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(6),
          onTap: () {
            if (widget.isLoading != null) {
              widget.isLoading! ? () {} : widget.onTap();
              FocusScope.of(context).requestFocus(FocusNode());
            } else {
              widget.onTap();
            }
          },
          child: Container(
            alignment: Alignment.center,
            child: widget.isLoading == null
                ? Text(
                    widget.allCaps == false
                        ? widget.text
                        : widget.text.toUpperCase(),
                    style: widget.textStyle ??
                        AppStyles.titleSmall.copyWith(color: AppColors.black),
                  )
                : widget.isLoading!
                    ? Container(
                        alignment: Alignment.center,
                        width: 26,
                        height: 26,
                        child: const CircularProgressIndicator(
                          color: AppColors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        widget.allCaps == false
                            ? widget.text
                            : widget.text.toUpperCase(),
                        style: widget.textStyle ??
                            AppStyles.titleSmall
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
      this.radius,
      this.title});

  final String icon;
  final String? title;
  final Color background;
  final Color splash;
  final VoidCallback voidCallback;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: width ?? 40,
          height: height ?? 40,
          decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(radius ?? 7)),
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
        ),
        title == null ? Container() : const SizedBox(height: 6),
        title == null
            ? Container()
            : Text(
                title!,
                style: AppStyles.titleMedium.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textOnboardingBrown),
              )
      ],
    );
  }
}
