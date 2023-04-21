import 'package:flutter/cupertino.dart';

import 'colors.dart';

class AppDeepBackground extends StatefulWidget {
  const AppDeepBackground(
      {super.key,
      required this.child,
      this.topColor,
      this.bottomColor,
      this.flexTop,
      this.flexBottom});

  final Widget child;
  final Color? topColor;
  final Color? bottomColor;
  final int? flexTop;
  final int? flexBottom;

  @override
  State<StatefulWidget> createState() {
    return _AppDeepBackground();
  }
}

class _AppDeepBackground extends State<AppDeepBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_buildDeepBackground(), widget.child],
    );
  }

  Widget _buildDeepBackground() {
    return Column(
      children: [
        Flexible(
          flex: widget.flexTop ?? 1,
          child: Container(
            color: widget.topColor ?? AppColors.primary,
          ),
        ),
        Flexible(
          flex: widget.flexBottom ?? 1,
          child: Container(
            color: widget.bottomColor ?? AppColors.white,
          ),
        )
      ],
    );
  }
}
