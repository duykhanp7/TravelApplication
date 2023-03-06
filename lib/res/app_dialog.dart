import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

enum TypeDialog { error, success, warning, info, link }

class AppDialog extends StatefulWidget {
  const AppDialog(
      {super.key,
      required this.content,
      required this.positiveAction,
      this.negativeAction,
      this.typeDialog,
      this.negativeTitle,
      this.positiveTitle});

  final String content;
  final String? negativeTitle;
  final String? positiveTitle;
  final VoidCallback positiveAction;
  final VoidCallback? negativeAction;
  final TypeDialog? typeDialog;

  @override
  State<StatefulWidget> createState() {
    return _AppDialog();
  }
}

class _AppDialog extends State<AppDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: widget.typeDialog == null
              ? AppColors.success
              : widget.typeDialog! == TypeDialog.error
                  ? AppColors.error
                  : widget.typeDialog! == TypeDialog.success
                      ? AppColors.success
                      : widget.typeDialog! == TypeDialog.warning
                          ? AppColors.warning
                          : widget.typeDialog! == TypeDialog.info
                              ? AppColors.info
                              : AppColors.link,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 200,
        margin: const EdgeInsets.only(left: 20, right: 20),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   AppIcons.notificationNone,
                //   color: AppColors.primary,
                //   width: 20,
                //   height: 20,
                // ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.content,
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            margin: const EdgeInsets.only(left: 10, right: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.black.withOpacity(0.3)),
                            child: Text(widget.negativeTitle ?? 'Cancel',
                                style: context.textStyle.titleMedium?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18)),
                          ),
                          Container(
                            height: 40,
                            margin: const EdgeInsets.only(left: 10, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.transparent),
                            child: Material(
                              color: AppColors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashColor: AppColors.white.withOpacity(0.1),
                                highlightColor:
                                    AppColors.white.withOpacity(0.1),
                                onTap: () => Navigator.of(context).pop(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            margin: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primary.withOpacity(0.8)),
                            child: Text(
                              widget.positiveTitle ?? 'OK',
                              style: context.textStyle.titleMedium?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 40,
                            margin: const EdgeInsets.only(left: 20, right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.transparent),
                            child: Material(
                              color: AppColors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                splashColor: AppColors.black.withOpacity(0.1),
                                highlightColor:
                                    AppColors.black.withOpacity(0.1),
                                onTap: widget.positiveAction,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
                top: 0,
                right: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      AppIcons.icClose,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.transparent),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
