import 'package:flutter/material.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/screens/splash/splash_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fellow 4U",
      theme: ThemeData(
        backgroundColor: AppColors.white,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
