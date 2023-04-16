import 'package:flutter/material.dart';
import 'package:travel_booking_tour/res/colors.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch(
      {super.key, this.width, this.height, required this.onClick, this.state});
  final double? width;
  final double? height;
  final Function(bool) onClick;
  final bool? state;

  @override
  State<StatefulWidget> createState() {
    return _AppSwitch();
  }
}

class _AppSwitch extends State<AppSwitch> {
  bool state = false;
  final double defaultHeight = 26;
  final double defaultWidth = 50;

  @override
  void initState() {
    state = widget.state ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        splashColor: AppColors.white.withOpacity(0.2),
        highlightColor: AppColors.white.withOpacity(0.2),
        child: Container(
          color: AppColors.transparent,
          child: Stack(
            children: [
              Container(
                  width: widget.width ?? defaultWidth,
                  height: widget.height ?? defaultHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: state ? AppColors.primary : AppColors.white,
                      border: Border.all(
                          width: 1,
                          color: state
                              ? AppColors.primary
                              : AppColors.textHintColor))),
              AnimatedPositioned(
                  right: state ? 4 : defaultWidth - 22,
                  top: 4,
                  bottom: 4,
                  left: state ? defaultWidth - 22 : 4,
                  curve: Curves.easeInOutCubicEmphasized,
                  duration: const Duration(seconds: 1),
                  child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          color:
                              state ? AppColors.white : AppColors.textHintColor,
                          borderRadius: BorderRadius.circular(9)))),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            state = !state;
          });
        },
      ),
    );
  }
}
