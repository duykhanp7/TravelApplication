import 'package:flutter/services.dart';

import 'colors.dart';

class AppSystem {
  static const systemStyle = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light);

  static const systemTransparentStatusBar = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.light);

  static const systemLightStatusBar = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark);
}
