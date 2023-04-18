import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/app_main.dart';
import 'package:travel_booking_tour/service/dynamic_deep_link_service.dart';
import 'package:travel_booking_tour/res/system.dart';

import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(AppSystem.systemStyle);

  await DynamicDeepLinkService.initialDeepLink();

  runApp(const MainApp());
}
