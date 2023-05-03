import 'package:flutter/material.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/styles.dart';

class AppRadioButton extends StatefulWidget {
  const AppRadioButton(
      {super.key,
      required this.id,
      required this.text,
      required this.selectedId,
      this.textStyle,
      this.activeColor,
      this.inActiveColor,
      this.activeBorderColor,
      this.inActiveBoderColor,
      required this.onTap});

  final dynamic id;
  final dynamic selectedId;
  final String text;
  final TextStyle? textStyle;
  final Color? activeColor;
  final Color? inActiveColor;
  final Color? activeBorderColor;
  final Color? inActiveBoderColor;
  final Function(dynamic) onTap;

  @override
  State<StatefulWidget> createState() {
    return _AppRadioButton();
  }
}

class _AppRadioButton extends State<AppRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30)),
            child: Material(
              color: AppColors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: InkWell(
                splashColor: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      border: Border.all(
                          color: widget.id == widget.selectedId
                              ? widget.activeBorderColor ?? AppColors.primary
                              : widget.inActiveBoderColor ??
                                  AppColors.inActiveRadioBorderColor,
                          width: 2)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: widget.id == widget.selectedId
                                ? widget.activeColor ?? AppColors.primary
                                : widget.inActiveColor ?? AppColors.white,
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  widget.onTap(widget.id);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.text,
            style: widget.textStyle ??
                AppStyles.titleMedium.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textRadioItalicColor),
          )
        ],
      ),
    );
  }
}
