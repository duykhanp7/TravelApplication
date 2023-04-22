import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

class AppEmptyPage extends StatefulWidget {
  const AppEmptyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppEmptyPage();
  }
}

class _AppEmptyPage extends State<AppEmptyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: SvgPicture.asset(AppIcons.icEmptyPage),
      ),
    );
  }
}
