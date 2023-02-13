import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import 'icons.dart';

class HorizontalStarWidget extends StatefulWidget {
  const HorizontalStarWidget({super.key, required this.rating});
  final int rating;

  @override
  State<StatefulWidget> createState() {
    return _HorizontalStarWidget();
  }
}

class _HorizontalStarWidget extends State<HorizontalStarWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        itemBuilder: (context, index) => SizedBox(
          child: SvgPicture.asset(AppIcons.star),
        ),
        itemCount: widget.rating,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          width: 2,
        ),
      ),
    );
  }
}
