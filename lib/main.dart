import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/app_main.dart';
import 'package:travel_booking_tour/res/system.dart';

import 'bloc_observer.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);

  runApp(const MainApp());
}
