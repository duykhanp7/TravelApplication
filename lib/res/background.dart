import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';

import 'clip_path.dart';
import 'colors.dart';
import 'icons.dart';

class AppBackground extends StatelessWidget {
  const AppBackground(
      {super.key, required this.children, required this.header});
  final Widget children;
  final String header;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_buildBackground(), _buildBody(context)],
    );
  }

  Widget _buildBackground() {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.appLogo,
                        width: 32, height: 38, color: AppColors.primary),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.point,
                          width: 4,
                          height: 4,
                          color: AppColors.primary,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        SvgPicture.asset(AppIcons.point,
                            width: 4, height: 4, color: AppColors.primary)
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  AppIcons.plane,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 100,
            child: SvgPicture.asset(
              AppIcons.wavePlan,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            left: 100,
            right: 0,
            top: 50,
            child: SvgPicture.asset(
              AppIcons.cloudyBlur2,
              alignment: Alignment.center,
              width: 57,
              height: 25,
            ),
          )
        ],
      ),
    );
  }

  Positioned _buildBody(BuildContext context) {
    return Positioned(
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 140,
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  color: AppColors.white,
                ),
              ),
            ),
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 32),
                    child: Text(
                      header,
                      style: context.textStyle.titleLarge!.copyWith(
                          fontSize: 34,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  children
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
