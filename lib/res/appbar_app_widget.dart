import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/router/routes.dart';

class AppbarAppWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarAppWidget(
      {super.key,
      this.title,
      this.prefixWidget,
      this.suffixWidget,
      this.prefixAction,
      this.suffixAction,
      this.titleStyle,
      this.background});

  final String? title;
  final TextStyle? titleStyle;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final VoidCallback? prefixAction;
  final VoidCallback? suffixAction;
  final Color? background;

  @override
  State<StatefulWidget> createState() {
    return _AppbarAppWidget();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarAppWidget extends State<AppbarAppWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.background ?? AppColors.white,
      centerTitle: true,
      title: Text(widget.title ?? ''),
      elevation: 0,
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
                onTap: () => widget.prefixAction ?? Routes.backTo(),
              ),
            ),
          ),
      titleTextStyle: widget.titleStyle ??
          context.textStyle.titleMedium?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic,
              color: AppColors.textOnboardingBlack),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          color: AppColors.transparent,
          child: Material(
            color: AppColors.transparent,
            child: InkWell(
              splashColor: AppColors.black.withOpacity(0.1),
              highlightColor: AppColors.black.withOpacity(0.1),
              child: widget.suffixWidget ?? Container(),
              onTap: () => widget.suffixAction ?? Routes.backTo(),
            ),
          ),
        )
      ],
    );
  }
}
