import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';

class AppLayoutShimmer extends StatelessWidget {
  const AppLayoutShimmer({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: SizedBox(
          width: width ?? 50,
          height: height ?? 50,
          child: Shimmer.fromColors(
              baseColor: AppColors.primary.withOpacity(0.4),
              highlightColor: AppColors.white.withOpacity(0.2),
              direction: ShimmerDirection.ltr,
              child: SvgPicture.asset(AppIcons.appLogo)),
        ),
      ),
    );
  }
}
