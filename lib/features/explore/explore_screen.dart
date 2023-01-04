import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/l10n/generated/l10n.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/images.dart';
import 'package:travel_booking_tour/res/system.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExploreScreen();
  }
}

class _ExploreScreen extends State<ExploreScreen> {
  late SLocalization localization;
  @override
  Widget build(BuildContext context) {
    localization = SLocalization.of(context);
    SystemChrome.setSystemUIOverlayStyle(AppSystem.systemTransparentStatusBar);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [_buildbody(), _buildHeader(width)],
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    return SizedBox(
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 185,
            alignment: Alignment.topCenter,
            child: Image.asset(
              AppImages.bgHeaderXplore,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 16,
            child: Text(
              localization.explore,
              style: context.textStyle.titleLarge?.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                  color: AppColors.white),
            ),
          ),
          Positioned(
              right: 0,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(AppIcons.cloudyWhite),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.locationWhite),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Da Nang',
                            style: context.textStyle.titleSmall?.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.italic,
                                color: AppColors.white),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '26\u00B0',
                        style: context.textStyle.titleLarge?.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: const Offset(-2, 2),
                          blurRadius: 3,
                          color: AppColors.textSkipColor.withOpacity(0.3))
                    ]),
                height: 40,
                child: TextFormField(
                  style: context.textStyle.titleMedium?.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.w400),
                  cursorColor: AppColors.textSkipColor,
                  decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        width: 16,
                        height: 16,
                        child: SvgPicture.asset(
                          AppIcons.search,
                          width: 16,
                          height: 16,
                          fit: BoxFit.none,
                        ),
                      ),
                      hintStyle: context.textStyle.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textSkipColor),
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hintText: localization.hi_where_do_u_want_to_explore),
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildbody() {
    return Container();
  }
}
