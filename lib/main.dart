import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_booking_tour/app_main.dart';
import 'package:travel_booking_tour/res/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: AppColors.primary,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MainApp());
}
