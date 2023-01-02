import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/app_main.dart';
import 'package:travel_booking_tour/res/colors.dart';

import 'bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarColor: AppColors.primary,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const MainApp());
}
