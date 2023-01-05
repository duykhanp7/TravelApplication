import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../icons.dart';

class VerticalStarWidget extends StatefulWidget {
  const VerticalStarWidget({super.key, required this.rating});
  final int rating;

  @override
  State<StatefulWidget> createState() {
    return _VerticalStarWidget();
  }
}

class _VerticalStarWidget extends State<VerticalStarWidget> {
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
