import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/icons.dart';

import 'app_inkwell.dart';
import 'colors.dart';

class AppButtonFavorite extends StatefulWidget {
  const AppButtonFavorite(
      {super.key,
      required this.isFavorite,
      this.size,
      this.iconSize,
      required this.onClick,
      this.background,
      this.iconActive,
      this.iconInActive,
      this.iconTint});
  final bool isFavorite;
  final Size? size;
  final Size? iconSize;
  final Function(bool)? onClick;
  final Color? background;
  final Color? iconTint;
  final String? iconActive;
  final String? iconInActive;

  @override
  State<StatefulWidget> createState() {
    return _AppButtonFavorite();
  }
}

class _AppButtonFavorite extends State<AppButtonFavorite> {
  bool isFavorite = false;

  @override
  void initState() {
    isFavorite = widget.isFavorite;
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
              isFavorite = !isFavorite;
              widget.onClick!(isFavorite);
            });
          }
        },
        iconTint: widget.iconTint ?? AppColors.white,
        icon: isFavorite
            ? (widget.iconActive ?? AppIcons.favoriteFill)
            : (widget.iconInActive ?? AppIcons.icFavoriteWhiteNull));
  }
}
