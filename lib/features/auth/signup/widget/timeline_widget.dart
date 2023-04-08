import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/res/colors.dart';

import '../../../../res/styles.dart';

class TimelineWidget extends StatefulWidget {
  const TimelineWidget(
      {super.key,
      this.background,
      required this.currentStep,
      required this.titles,
      required this.padding,
      this.paddingParent});

  final Color? background;
  final int currentStep;
  final EdgeInsets padding;
  final EdgeInsets? paddingParent;
  final List<String> titles;

  @override
  State<StatefulWidget> createState() {
    return _TimelineWidget();
  }
}

class _TimelineWidget extends State<TimelineWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Container(
            margin: widget.paddingParent ??
                const EdgeInsets.only(left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TimelineIndicator(
                      isActive: true,
                    ),
                    HorizontalDotSeperated(
                        isActive: widget.currentStep == 1, length: 40),
                    TimelineIndicator(
                      isActive: widget.currentStep == 1,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: widget.padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.titles[0],
                        style: AppStyles.titleMedium.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary),
                      ),
                      Text(
                        widget.titles[1],
                        style: AppStyles.titleMedium.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: widget.currentStep == 1
                                ? AppColors.primary
                                : AppColors.textHintColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TimelineIndicator extends StatefulWidget {
  const TimelineIndicator(
      {super.key, required this.isActive, this.color, this.overlap});

  final bool isActive;
  final Color? color;
  final Color? overlap;

  @override
  State<StatefulWidget> createState() {
    return _TimelineIndicator();
  }
}

class _TimelineIndicator extends State<TimelineIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: widget.isActive
                        ? AppColors.timeLineIndicator.withOpacity(0.3)
                        : AppColors.textHintColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    color: widget.isActive
                        ? AppColors.timeLineIndicator
                        : AppColors.textHintColor,
                    borderRadius: BorderRadius.circular(4)),
              )
            ],
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          // widget.title == null
          //     ? Container()
          //     : Text(
          //         widget.title!,
          //         style: AppStyles.titleMedium.copyWith(
          //             fontSize: 14,
          //             fontWeight: FontWeight.w500,
          //             color: widget.isActive
          //                 ? AppColors.primary
          //                 : AppColors.textHintColor),
          //       )
        ],
      ),
    );
  }
}

class HorizontalDotSeperated extends StatefulWidget {
  const HorizontalDotSeperated(
      {super.key, required this.isActive, required this.length});

  final bool isActive;
  final int length;

  @override
  State<StatefulWidget> createState() {
    return _HorizontalDotSeperated();
  }
}

class _HorizontalDotSeperated extends State<HorizontalDotSeperated> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            widget.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(left: 1, right: 1),
                  child: Container(
                    height: 1,
                    width: 2,
                    color: widget.isActive
                        ? AppColors.primary
                        : AppColors.underLineTextFieldColor,
                  ),
                )),
      ),
    );
  }
}
