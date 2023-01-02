import 'package:flutter/material.dart';
import 'package:travel_booking_tour/features/onboarding/onboarding_screen.dart';
import 'package:travel_booking_tour/res/colors.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fellow 4U",
      theme: ThemeData(backgroundColor: AppColors.white, fontFamily: 'Roboto'),
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
