import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/res/icons.dart';
import 'package:travel_booking_tour/res/images.dart';

class OnboardingHeader1 extends StatelessWidget {
  const OnboardingHeader1({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTopHeader1(context);
  }

  Widget _buildTopHeader1(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            color: AppColors.white,
            child: SvgPicture.asset(AppIcons.bgLayer1),
          ),
          Positioned(
              top: 50,
              left: width - (2 * (width / 3)) - 50,
              child: SvgPicture.asset(
                width: 70,
                height: 35,
                AppIcons.cloudyLight2,
              )),
          Positioned(
              bottom: 30,
              right: 50,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    SvgPicture.asset(width: 128, height: 250, AppIcons.girl1),
                    SvgPicture.asset(height: 250, width: 150, AppIcons.boy),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class OnboardingHeader2 extends StatelessWidget {
  const OnboardingHeader2({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTopHeader2(context);
  }

  Widget _buildTopHeader2(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.only(top: 5),
      height: 500,
      child: Column(children: [
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(
              bottom: 10, right: width - (2 * (width / 3)) - 30),
          child: SvgPicture.asset(
            width: 70,
            height: 35,
            AppIcons.cloudyLight2,
          ),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerRight,
              color: AppColors.white,
              child: SvgPicture.asset(
                AppIcons.bgLayer2,
                width: width,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.card1,
                  width: 150,
                ),
                Image.asset(
                  AppImages.card2,
                  width: 150,
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(width: 100, height: 250, AppIcons.girl2),
                    ],
                  ),
                ))
          ],
        ),
      ]),
    );
  }
}

class OnboardingHeader3 extends StatelessWidget {
  const OnboardingHeader3({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildTopHeader3(context);
  }

  Widget _buildTopHeader3(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            color: AppColors.white,
            child: SvgPicture.asset(AppIcons.bgLayer3),
          ),
          Positioned(
              top: 50,
              left: width - (2 * (width / 3)) - 50,
              child: SvgPicture.asset(
                width: 70,
                height: 35,
                AppIcons.cloudyLight2,
              )),
          Positioned(
              top: 110,
              left: width - (2 * (width / 3)) - 80,
              child: SvgPicture.asset(
                width: 61,
                height: 55,
                AppIcons.messageYellow,
              )),
          Positioned(
              top: 210,
              right: width - (2 * (width / 3)) - 80,
              child: SvgPicture.asset(
                width: 61,
                height: 55,
                AppIcons.messageYellow,
              )),
          Positioned(
              top: 50,
              left: width - (2 * (width / 3)) + 20,
              child: _buildWaveVertical()),
          Positioned(
              bottom: 30,
              left: 80,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    SvgPicture.asset(width: 128, height: 250, AppIcons.girl3),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _buildWaveVertical() {
    return Stack(alignment: Alignment.center, children: [
      SvgPicture.asset(
        AppIcons.waveVertical,
      ),
      Container(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppIcons.location),
            SvgPicture.asset(AppIcons.bar1),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(AppIcons.earth),
            SvgPicture.asset(AppIcons.bar2),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(AppIcons.calendar),
            SvgPicture.asset(AppIcons.bar2),
          ],
        ),
      ),
    ]);
  }
}
