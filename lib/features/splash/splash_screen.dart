import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_screen.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_state.dart';
import 'package:travel_booking_tour/res/res.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocBuilder<BlocSplashScreen, BlocSplashState>(
        builder: (context, state) => SafeArea(
            child: Container(
          width: width,
          color: AppColors.primary,
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: _buildTopHeader(),
              ),
              Flexible(
                flex: 3,
                child: _buildWidgetFellow(),
              ),
              Flexible(
                flex: 3,
                child: _buildBottomHeader(context),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildWidgetFellow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 3),
              child: Wrap(
                direction: Axis.vertical,
                spacing: -15,
                alignment: WrapAlignment.end,
                runAlignment: WrapAlignment.end,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  const Text(
                    'Fellow',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 40,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        '4U',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: AppColors.white,
                            fontFamily: 'Roboto',
                            fontSize: 45,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  )
                ],
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset(AppIcons.appLogo),
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.point),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(AppIcons.point)
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildTopHeader() {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  AppIcons.cloudyBlur1,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  AppIcons.wavePlan,
                ),
              )
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: SvgPicture.asset(AppIcons.cloudyLight),
              ),
              Stack(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: SvgPicture.asset(AppIcons.plane),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20),
                        child: SvgPicture.asset(AppIcons.cloudyBlur2),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBottomHeader(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(bottom: 40),
            child: SvgPicture.asset(
              AppIcons.leaf3,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              AppIcons.bottomWave,
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10, left: 5),
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    AppIcons.leaf1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 0, bottom: 10),
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    AppIcons.leaf2,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.only(
                      left: 0, bottom: 10, right: 100, top: 30),
                  child: SvgPicture.asset(
                    AppIcons.hatIcon,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
