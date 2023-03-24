import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';

class AppbarAppWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarAppWidget({
    super.key,
    this.title,
    this.prefixWidget,
    this.suffixWidget,
    this.titleStyle,
    this.background,
    this.flexibleSpace,
    this.bottom,
    this.height,
  });

  final String? title;
  final TextStyle? titleStyle;
  final Widget? prefixWidget;
  final Widget? flexibleSpace;
  final Widget? suffixWidget;
  final PreferredSizeWidget? bottom;
  final Color? background;
  final double? height;

  @override
  State<StatefulWidget> createState() {
    return _AppbarAppWidget();
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}

class _AppbarAppWidget extends State<AppbarAppWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.background ?? AppColors.white,
      centerTitle: true,
      title: Text(widget.title ?? ''),
      elevation: 0,
      flexibleSpace: widget.flexibleSpace,
      bottom: widget.bottom,
      leading: widget.prefixWidget ??
          Container(
            width: 25,
            height: 25,
            color: AppColors.transparent,
            child: Material(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                child: widget.prefixWidget ??
                    const Icon(
                      Icons.close,
                      color: AppColors.black,
                      size: 25,
                    ),
                onTap: () => Navigator.of(context).maybePop(),
              ),
            ),
          ),
      titleTextStyle: widget.titleStyle ??
          context.textStyle.titleMedium?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic,
              color: AppColors.textOnboardingBlack),
      actions: [widget.suffixWidget ?? Container()],
    );
  }
}