import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/res.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      this.initialText,
      this.hintText,
      this.hintTextStyle,
      this.textStyle,
      this.textInputType,
      this.obsecureText,
      this.width,
      this.height,
      this.labelText,
      this.labelTextStyle,
      this.validator,
      this.autovalidateMode,
      this.onChange,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.isDense,
      this.contentPadding,
      this.textAlign,
      this.textEditingController});

  final String? initialText;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final TextInputType? textInputType;
  final bool? obsecureText;
  final double? width;
  final double? height;
  final dynamic validator;
  final Function(String)? onChange;
  final AutovalidateMode? autovalidateMode;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign;
  final TextEditingController? textEditingController;

  @override
  State<StatefulWidget> createState() {
    return _AppTextField();
  }
}

class _AppTextField extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          widget.labelText == null
              ? Container()
              : Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.labelText ?? '',
                    style: widget.labelTextStyle ??
                        context.textStyle.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                            fontStyle: FontStyle.normal),
                  ),
                ),
          widget.labelText == null
              ? Container()
              : const SizedBox(
                  height: 12,
                ),
          TextFormField(
            keyboardType: widget.textInputType ?? TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            textAlign: widget.textAlign ?? TextAlign.start,
            controller: widget.textEditingController,
            decoration: InputDecoration(
                icon: widget.icon,
                prefixIconConstraints:
                    const BoxConstraints(minHeight: 25, minWidth: 25),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                hintText: widget.hintText,
                hintStyle: widget.hintTextStyle ??
                    context.textStyle.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textHintColor,
                        fontStyle: FontStyle.normal),
                isCollapsed: true,
                isDense: widget.isDense ?? true,
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.only(
                      bottom: 10,
                    ),
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: AppColors.underLineTextFieldColor)),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: AppColors.underLineTextFieldColor)),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: AppColors.underLineTextFieldColor))),
            obscureText: widget.obsecureText ?? false,
            onChanged: widget.onChange ?? (value) {},
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.done,
            cursorColor: AppColors.textHintColor,
            style: widget.textStyle ??
                context.textStyle.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
          )
        ],
      ),
    );
  }
}
