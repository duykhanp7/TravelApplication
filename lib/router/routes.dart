import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static final GlobalKey<NavigatorState> navigator =
      GlobalKey<NavigatorState>();

  static void navigateToAndRemoveUntil(String namePage, String arguments) {
    navigator.currentState?.pushNamedAndRemoveUntil(namePage, (route) => false,
        arguments: arguments);
  }

  static void navigateTo(String namePage, String arguments) {
    navigator.currentState?.pushNamed(namePage, arguments: arguments);
  }
}
