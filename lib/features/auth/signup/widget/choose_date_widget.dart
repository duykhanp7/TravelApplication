import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/res/colors.dart';

class ChooseDateWidget extends StatefulWidget {
  const ChooseDateWidget(
      {super.key,
      required this.current,
      required this.dates,
      required this.onClick});
  final int current;
  final List<String> dates;
  final Function(int index) onClick;

  @override
  State<StatefulWidget> createState() {
    return _ChooseDateWidget();
  }
}

class _ChooseDateWidget extends State<ChooseDateWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.dates.length,
        itemBuilder: (context, index) => DateItemWidget(
          isChosen: widget.current == index,
          title: widget.dates[index],
          index: index,
          onClick: widget.onClick,
        ),
      ),
    );
  }
}

class DateItemWidget extends StatefulWidget {
  final bool isChosen;
  final String title;
  final int index;
  final Function(int index) onClick;

  const DateItemWidget(
      {super.key,
      required this.isChosen,
      required this.title,
      required this.onClick,
      required this.index});
  @override
  State<StatefulWidget> createState() {
    return _DateItemWidget();
  }
}

class _DateItemWidget extends State<DateItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 90,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
              color: widget.isChosen ? AppColors.primary : AppColors.white,
              borderRadius: BorderRadius.circular(4)),
          child: Text(
            widget.title,
            style: context.textStyle.titleSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: widget.isChosen
                    ? AppColors.white
                    : AppColors.textSkipColor),
          ),
        ),
        Container(
          width: 90,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(4)),
          child: Material(
            color: AppColors.transparent,
            borderRadius: BorderRadius.circular(4),
            child: InkWell(
                splashColor: widget.isChosen
                    ? AppColors.white.withOpacity(0.2)
                    : AppColors.primary.withOpacity(0.2),
                highlightColor: widget.isChosen
                    ? AppColors.white.withOpacity(0.2)
                    : AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
                onTap: () {
                  widget.onClick(widget.index);
                }),
          ),
        )
      ],
    );
  }
}
