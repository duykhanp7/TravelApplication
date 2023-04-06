import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/features/onboarding/bloc/bloc_onboarding_event.dart';
import 'package:travel_booking_tour/features/onboarding/bloc/bloc_onboarding_screen.dart';
import 'package:travel_booking_tour/features/onboarding/bloc/bloc_onboarding_state.dart';
import 'package:travel_booking_tour/features/onboarding/model/onboarding_json.dart';
import 'package:travel_booking_tour/features/onboarding/onboarding_Page.dart';
import 'package:travel_booking_tour/features/onboarding/widget/onboarding_header.dart';
import 'package:travel_booking_tour/res/res.dart';

import '../../res/button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnboardingScreen();
  }
}

class _OnboardingScreen extends State<OnboardingScreen> {
  List<Widget> widgets = <Widget>[];
  List<OnboardingJson> models = <OnboardingJson>[];
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<BlocOnboardingScreen, BlocOnboardingState>(
        builder: (context, state) => SafeArea(
            child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              itemBuilder: (context, index) => OnboardingPage(
                  widget: widgets[index], onboardingModel: models[index]),
              itemCount: 3,
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
            Visibility(
                visible: currentIndex <= 1,
                child: Positioned(
                    bottom: 150, child: _buildIndicator(currentIndex))),
            Visibility(
              visible: currentIndex >= 2,
              child: Positioned(
                  bottom: 96,
                  left: 0,
                  right: 0,
                  child: _buildButtonGetStarted()),
            ),
            Visibility(
              visible: currentIndex <= 1,
              child: Positioned(
                  bottom: 70,
                  right: 31,
                  child: Material(
                    color: AppColors.white,
                    child: InkWell(
                      splashColor: AppColors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 50,
                        child: Text(
                          'SKIP',
                          style: AppStyles.titleSmall
                              .copyWith(color: AppColors.textSkipColor),
                        ),
                      ),
                      onTap: () {
                        BlocProvider.of<BlocOnboardingScreen>(context)
                            .add(BlocOnboardingEventOnButtonSkipClick());
                      },
                    ),
                  )),
            ),
          ],
        )),
      )),
    );
  }

  Widget _buildIndicator(int currentIndex) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: List.generate(
            widgets.length,
            (index) => Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 2,
                  width: currentIndex == index ? 20 : 10,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: currentIndex == index
                          ? AppColors.primary
                          : AppColors.indicatorOnboardingColor),
                )),
      ),
    );
  }

  Widget _buildButtonGetStarted() {
    return PrimaryActiveButton(
      text: 'GET STARTED',
      onTap: () {
        BlocProvider.of<BlocOnboardingScreen>(context)
            .add(BlocOnboardingEventOnButtonGetStartedClick());
      },
    );
  }

  @override
  void initState() {
    super.initState();

    widgets.add(const OnboardingHeader1());
    widgets.add(const OnboardingHeader2());
    widgets.add(const OnboardingHeader3());

    models.add(const OnboardingJson(
        description: 'Find a local guide easily',
        content:
            'With Fellow4U, you can find a local guide for you trip easily and explore as the way you want.'));
    models.add(const OnboardingJson(
        description: 'Many tours around the world',
        content:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'));
    models.add(const OnboardingJson(
        description: 'Create a trip and get offers',
        content:
            'Fellow4U helps you save time and get offers from hundred local guides that suit your trip.'));
  }
}
