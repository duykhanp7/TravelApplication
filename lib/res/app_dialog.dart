import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extension/list_extension.dart';
import 'package:travel_booking_tour/common/extension/num_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/styles.dart';
import 'package:travel_booking_tour/res/svg_icon.dart';

class DefaultDialog extends StatelessWidget {
  const DefaultDialog({
    super.key,
    this.image,
    this.title,
    this.content,
    this.actions = const <Widget>[],
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.radius,
    this.dialogWidth = 345.0,
    this.horizontalPadding,
    this.hideIconClose = false,
  }) : assert(title != null || content != null);

  const DefaultDialog.success(
      {super.key,
      this.title,
      this.content,
      this.actions = const <Widget>[],
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.radius,
      this.dialogWidth = 345.0,
      this.horizontalPadding,
      this.hideIconClose = false})
      : assert(title != null || content != null),
        image = const SvgIcon(AppIcons.icSuccess, size: 48);

  const DefaultDialog.warning({
    super.key,
    this.title,
    this.content,
    this.actions = const <Widget>[],
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.radius,
    this.dialogWidth = 345.0,
    this.horizontalPadding,
    this.hideIconClose = false,
  })  : assert(title != null || content != null),
        image = const SvgIcon(AppIcons.icWarning, size: 48);

  final Widget? image;
  final Widget? title;
  final Widget? content;
  final List<Widget> actions;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final BorderRadiusGeometry? radius;
  final double dialogWidth;
  final double? horizontalPadding;
  final bool hideIconClose;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: 0.insetAll,
      shape: RoundedRectangleBorder(borderRadius: radius ?? 24.borderRadius),
      backgroundColor: AppColors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: dialogWidth,
            padding: 24.insetVertical.add(horizontalPadding != null
                ? EdgeInsets.only(
                    left: horizontalPadding!, right: horizontalPadding!)
                : 16.insetHorizontal),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              mainAxisAlignment: mainAxisAlignment,
              children: <Widget>[
                if (image != null) ...<Widget>[
                  Center(child: image),
                  16.gapHeight,
                ],
                if (title != null)
                  DefaultTextStyle(
                    style:
                        AppStyles.titleMedium.copyWith(color: AppColors.black),
                    textAlign: TextAlign.center,
                    child: title!,
                  ),
                if (title != null && content != null) 16.gapHeight,
                if (content != null)
                  DefaultTextStyle(
                    style: AppStyles.titleSmall.copyWith(
                        fontWeight: FontWeight.w400, color: AppColors.black),
                    textAlign: TextAlign.center,
                    child: content!,
                  ),
                if (actions.isNotEmpty) ...[
                  16.gapHeight,
                  ...actions.applySeparator(8.gapHeight),
                ]
              ],
            ),
          ),
          Visibility(
            visible: !hideIconClose,
            child: Positioned(
              top: 15,
              right: 18,
              child: InkWell(
                  onTap: Navigator.of(context, rootNavigator: true).pop,
                  child: const SvgIcon(AppIcons.icClose, size: 20)),
            ),
          ),
        ],
      ),
    );
  }

  void closeDialog() {}
}
