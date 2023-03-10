import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';

class TimelineWidget extends StatefulWidget {
  const TimelineWidget(
      {super.key,
      this.background,
      required this.currentStep,
      required this.titles});

  final Color? background;
  final int currentStep;
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: HorizontalDotSeperated(
                    isActive: widget.currentStep == 1, length: 40),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimelineIndicator(
                    isActive: true,
                    title: widget.titles[0],
                  ),
                  TimelineIndicator(
                    isActive: widget.currentStep == 1,
                    title: widget.titles[1],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineIndicator extends StatefulWidget {
  const TimelineIndicator(
      {super.key,
      required this.isActive,
      this.title,
      this.color,
      this.overlap});

  final bool isActive;
  final Color? color;
  final Color? overlap;
  final String? title;

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
          const SizedBox(
            height: 5,
          ),
          widget.title == null
              ? Container()
              : Text(
                  widget.title!,
                  style: context.textStyle.titleMedium?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: widget.isActive
                          ? AppColors.primary
                          : AppColors.textHintColor),
                )
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          widget.length,
          (index) => Container(
                margin: const EdgeInsets.only(left: 2),
                height: 1,
                width: 2,
                color: widget.isActive
                    ? AppColors.primary
                    : AppColors.underLineTextFieldColor,
              )),
    );
  }
}
