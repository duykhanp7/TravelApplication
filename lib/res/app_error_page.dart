import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

class AppErrorPage extends StatefulWidget {
  const AppErrorPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppErrorPage();
  }
}

class _AppErrorPage extends State<AppErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: SvgPicture.asset(AppIcons.icErrorPage, color: AppColors.primary),
      ),
    );
  }
}
