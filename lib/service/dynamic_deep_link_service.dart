import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';

import '../router/path.dart';
import '../router/routes.dart';
import '../common/app_constant.dart';

class DynamicDeepLinkService {
  static Future handleDynamicLnks() async {
    //Get initial dynamic link if the app is started using the link
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();

    await _handleDeepLink(data);

    //Into foreground from dynamic link logic
    FirebaseDynamicLinks.instance.onLink.listen((event) {}).onData((data) {
      debugPrint('FirebaseDynamicLinks.instance.onLink.listen');
      Routes.navigateToAndRemoveUntil(
          AppPath.settingChangePassword, {AppConstant.data: Password.reset});
    });
  }

  static Future _handleDeepLink(PendingDynamicLinkData? data) async {
    final Uri? deepLink = data?.link;
    if (deepLink != null) {
      debugPrint('_handleDeepLink');
      AppStorage appStorage = AppStorage();
      appStorage.saveData(AppConstant.deeplink, AppConstant.deeplink);
    }
  }
}
