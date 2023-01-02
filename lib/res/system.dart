import 'package:flutter/services.dart';

import 'colors.dart';

class AppSystem {
  static const systemStyle = SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.primary,
      statusBarIconBrightness: Brightness.light);
}
