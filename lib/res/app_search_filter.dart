import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/icons.dart';

import 'app_search.dart';
import 'colors.dart';

class AppSearchFilter extends StatefulWidget {
  const AppSearchFilter(
      {super.key,
      this.hintText,
      this.inputDecoration,
      this.readOnly,
      this.enable,
      this.showCursor,
      this.textStyle,
      this.cursorColor,
      this.prefixIcon,
      this.margin,
      this.onTap,
      this.onChange,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.prefixIconConstraints,
      this.decoration,
      this.height,
      this.width,
      this.onFilterClick,
      this.onClearText,
      this.visibilityFilter,
      this.autofocus});

  final InputDecoration? inputDecoration;
  final bool? readOnly;
  final bool? enable;
  final bool? showCursor;
  final TextStyle? textStyle;
  final Colors? cursorColor;
  final String? hintText;
  final Widget? prefixIcon;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Function(String)? onChange;
  final Function(String)? onEditingComplete;
  final VoidCallback? onFilterClick;
  final VoidCallback? onClearText;
  final Function(String)? onFieldSubmitted;
  final BoxConstraints? prefixIconConstraints;
  final Decoration? decoration;
  final double? height;
  final double? width;
  final bool? visibilityFilter;
  final bool? autofocus;

  @override
  State<StatefulWidget> createState() {
    return _AppSearchFilter();
  }
}

class _AppSearchFilter extends State<AppSearchFilter> {
  //bool isDone = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Row(
      children: [
        Expanded(
          child: AppSearch(
            textEditingController: _textEditingController,
            height: 50,
            autofocus: widget.autofocus,
            margin: EdgeInsets.zero,
            prefixIcon: Container(
              height: 15,
              width: 15,
              color: AppColors.transparent,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppColors.textSkipColor.withOpacity(0.2),
                      offset: const Offset(0, 0),
                      blurRadius: 8,
                      spreadRadius: 1)
                ]),
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 20),
            onClearText: () {
              if (widget.onClearText != null) {
                widget.onClearText!();
              }
              // setState(() {
              //   //isDone = false;

              // });
            },
            onChange: (value) {
              if (widget.onChange != null) {
                widget.onChange!(value);
              }
              // if (_textEditingController.text.isEmpty) {
              //   setState(() {
              //     isDone = false;
              //   });
              // }
            },
            onEditingComplete: () {
              if (widget.onEditingComplete != null) {
                widget.onEditingComplete!(_textEditingController.text);
              }
              // if (_textEditingController.text.isNotEmpty) {
              //   setState(() {
              //     isDone = true;
              //   });
              // } else {
              //   setState(() {
              //     isDone = false;
              //   });
              // }
            },
            hintText: widget.hintText ?? '',
          ),
        ),
        SizedBox(
            width: widget.visibilityFilter != null
                ? widget.visibilityFilter!
                    ? 16
                    : 0
                : 0),
        Visibility(
            visible: widget.visibilityFilter ?? false,
            child: InkWell(
              onTap: widget.onFilterClick,
              child: Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                child: SvgPicture.asset(AppIcons.icFilter),
              ),
            ))
      ],
    );
  }
}
