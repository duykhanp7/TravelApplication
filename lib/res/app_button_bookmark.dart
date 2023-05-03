import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/icons.dart';

import 'app_inkwell.dart';
import 'colors.dart';

class AppButtonBookmark extends StatefulWidget {
  const AppButtonBookmark(
      {super.key,
      required this.isBookmark,
      this.size,
      this.iconSize,
      required this.onClick,
      this.background});
  final bool isBookmark;
  final Size? size;
  final Size? iconSize;
  final Function(bool)? onClick;
  final Color? background;

  @override
  State<StatefulWidget> createState() {
    return _AppButtonBookmark();
  }
}

class _AppButtonBookmark extends State<AppButtonBookmark> {
  bool isBookmark = false;

  @override
  void initState() {
    isBookmark = widget.isBookmark;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
        size: widget.size ?? const Size(30, 30),
        iconSize: widget.iconSize ?? const Size(15, 15),
        background: widget.background,
        voidCallBack: () {
          if (widget.onClick != null) {
            setState(() {
              isBookmark = !isBookmark;
              widget.onClick!(isBookmark);
            });
          }
        },
        iconTint: AppColors.white,
        icon: isBookmark ? AppIcons.icBookmarked : AppIcons.icUnBookmarked);
  }
}
