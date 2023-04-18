import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:uni_links/uni_links.dart';

import '../router/path.dart';
import '../router/routes.dart';
import '../common/app_constant.dart';

bool _initialURILinkHandled = false;

class DynamicDeepLinkService {
  static Uri? _initialURI;
  static Uri? _currentURI;

  static Future<void> initialDeepLink() async {
    await _initURIHandler();
    _incomingLinkHandler();
  }

  static Future<void> _initURIHandler() async {
    if (!_initialURILinkHandled) {
      _initialURILinkHandled = true;
      try {
        final initialURI = await getInitialUri();
        // Use the initialURI and warn the user if it is not correct,
        // but keep in mind it could be `null`.
        if (initialURI != null) {
          // if (!mounted) {
          //   return;
          // }
          _initialURI = initialURI;
          AppStorage appStorage = AppStorage();
          String uri = _initialURI.toString();
          appStorage.saveData(AppConstant.deeplink, uri.split('=')[1]);
        }
      } on PlatformException {
        // Platform messages may fail, so we use a try/catch PlatformException.
        // Handle exception by warning the user their action did not succeed
      } on FormatException catch (err) {
        // if (!mounted) {
        //   return;
        // }
      }
    }
  }

  /// Handle incoming links - the ones that the app will receive from the OS
  /// while already started.
  static void _incomingLinkHandler() {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      uriLinkStream.listen((Uri? uri) {
        _currentURI = uri;
      }, onError: (Object err) {}).onData((data) {
        if (data != null) {
          AppStorage appStorage = AppStorage();
          String uri = data.toString();
          appStorage.saveData(AppConstant.deeplink, uri.split('=')[1]);
          Routes.navigateToAndRemoveUntil(AppPath.settingChangePassword,
              {AppConstant.data: Password.reset});
        }
      });
    }
  }
}
