import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extension/context_extension.dart';

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
    this.onTap,
    this.onChange,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.prefixIconConstraints,
    this.decoration,
    this.height,
    this.width,
    this.onClearText,
    this.textEditingController,
    this.autofocus,
  });

  final InputDecoration? inputDecoration;
  final bool? readOnly;
  final bool? enable;
  final bool? showCursor;
  final bool? autofocus;
  final TextStyle? textStyle;
  final Colors? cursorColor;
  final String? hintText;
  final Widget? prefixIcon;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Function(String)? onChange;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onClearText;
  final Function(String)? onFieldSubmitted;
  final BoxConstraints? prefixIconConstraints;
  final Decoration? decoration;
  final double? height;
  final double? width;
  final TextEditingController? textEditingController;

  @override
  State<StatefulWidget> createState() {
    return _AppSearch();
  }
}

class _AppSearch extends State<AppSearch> {
  bool isDone = false;
  late TextEditingController _textEditingController;
  bool showSuffixIconOnDone = true;

  @override
  void initState() {
    if (widget.textEditingController != null) {
      _textEditingController = widget.textEditingController!;
    } else {
      _textEditingController = TextEditingController();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: widget.margin ??
          const EdgeInsets.only(left: 16, right: 16, bottom: 18),
      decoration: widget.decoration ??
          BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: const Offset(-2, 2),
                    blurRadius: 3,
                    color: AppColors.textSkipColor.withOpacity(0.3))
              ]),
      height: widget.height ?? 40,
      child: TextFormField(
        showCursor: widget.showCursor,
        readOnly: widget.readOnly ?? false,
        enabled: widget.enable,
        expands: true,
        maxLines: null,
        autofocus: widget.autofocus ?? false,
        minLines: null,
        textInputAction: TextInputAction.done,
        controller: _textEditingController,
        style: widget.textStyle ??
            context.textStyle.titleMedium
                ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w400),
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
                prefixIconConstraints: widget.prefixIconConstraints,
                suffixIconConstraints:
                    const BoxConstraints(maxHeight: 50, maxWidth: 50),
                suffixIcon: Visibility(
                    visible: isDone,
                    child: InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                            color: AppColors.underLineTextFieldColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: const Icon(
                          Icons.clear,
                          size: 12,
                          color: AppColors.white,
                        ),
                      ),
                      onTap: () {
                        if (widget.onClearText != null) {
                          widget.onClearText!();
                        }
                        setState(() {
                          _textEditingController.text = '';
                          isDone = false;
                        });
                      },
                    )),
                hintStyle: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSkipColor),
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.transparent, width: 0),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: widget.hintText),
        onTap: widget.onTap,
        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!(value);
            if (showSuffixIconOnDone) {
              if (_textEditingController.text.isEmpty) {
                setState(() {
                  isDone = false;
                });
              }
            }
          }
        },
        onEditingComplete: () {
          if (widget.onEditingComplete != null) {
            widget.onEditingComplete!();
          }
          if (showSuffixIconOnDone) {
            if (_textEditingController.text.isNotEmpty) {
              setState(() {
                isDone = true;
              });
            } else {
              setState(() {
                isDone = false;
              });
            }
          }
          FocusScope.of(context).unfocus();
        },
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
