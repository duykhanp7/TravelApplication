import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';

import 'colors.dart';
import 'icons.dart';

class AppSearch extends StatefulWidget {
  const AppSearch({
    super.key,
    this.inputDecoration,
    this.readOnly,
    this.enable,
    this.showCursor,
    this.textStyle,
    this.cursorColor,
    this.hintText,
    this.prefixIcon,
    this.margin,
  });

  final InputDecoration? inputDecoration;
  final bool? readOnly;
  final bool? enable;
  final bool? showCursor;
  final TextStyle? textStyle;
  final Colors? cursorColor;
  final String? hintText;
  final Widget? prefixIcon;
  final EdgeInsets? margin;

  @override
  State<StatefulWidget> createState() {
    return _AppSearch();
  }
}

class _AppSearch extends State<AppSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: widget.margin ??
          const EdgeInsets.only(left: 16, right: 16, bottom: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: const Offset(-2, 2),
                blurRadius: 3,
                color: AppColors.textSkipColor.withOpacity(0.3))
          ]),
      height: 40,
      child: InkWell(
        onTap: () {
          debugPrint(' On Tap Or Not');
        },
        child: TextFormField(
          showCursor: widget.showCursor,
          readOnly: widget.readOnly ?? false,
          enabled: widget.enable,
          style: widget.textStyle ??
              context.textStyle.titleMedium?.copyWith(
                  color: AppColors.black, fontWeight: FontWeight.w400),
          cursorColor: AppColors.textSkipColor,
          decoration: widget.inputDecoration ??
              InputDecoration(
                  prefixIcon: widget.prefixIcon ??
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          AppIcons.search,
                          width: 16,
                          height: 16,
                          fit: BoxFit.none,
                        ),
                      ),
                  hintStyle: context.textStyle.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSkipColor),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.transparent, width: 0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: widget.hintText),
        ),
      ),
    );
  }
}
