import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking_tour/router/path.dart';

class Routes {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();

  static void navigateToAndRemoveUntil(String namePage, String arguments) {
    navigator.currentState?.pushNamedAndRemoveUntil(
        AppPath.onBoardingSCreen, (route) => false,
        arguments: arguments);
  }

  static void navigateTo(String namePage, String arguments) {
    navigator.currentState
        ?.pushNamed(AppPath.onBoardingSCreen, arguments: arguments);
  }
}
