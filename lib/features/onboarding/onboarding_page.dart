import 'package:flutter/material.dart';
import 'package:travel_booking_tour/common/extensions/context_extension.dart';
import 'package:travel_booking_tour/data/models/onboarding_model.dart';
import 'package:travel_booking_tour/res/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.widget,
    required this.onboardingModel,
  });

  final Widget widget;
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            widget,
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                onboardingModel.description,
                style: context.textStyle.titleLarge!.copyWith(
                    color: AppColors.textOnboardingBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 252,
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                textAlign: TextAlign.center,
                onboardingModel.content,
                style: context.textStyle.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.textOnboardingBrown),
              ),
            )
          ],
        ),
      )),
    );
  }
}
