import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/common/app_logger.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/common/get_location.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/auth/repository/auth_repository.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_event.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_state.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../data/model/user.dart';
import '../../../router/routes.dart';

class BlocSplashScreen extends Bloc<BlocSplashEvent, BlocSplashState> {
  final AuthRepository _authRepository = AuthRepository();
  final AppStorage _appStorage = AppStorage();
  BlocSplashScreen() : super(BlocSplashStateInitial()) {
    on<BlocSplashEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(
      BlocSplashEvent event, Emitter<BlocSplashState> emit) async {
    if (event is BlocSplashEventInitial) {
      try {
        final Position? currentPosition =
            await GetLocation.getGeoLocationPosition();
        debugPrint(
            'LatLng Position : ${currentPosition?.latitude} ${currentPosition?.longitude}');
        if (currentPosition != null) {
          final address =
              await GetLocation.getAddressFromLatLong(currentPosition);
          _appStorage.saveData(AppConstant.address, address ?? '');
        } else {
          _appStorage.delete(AppConstant.address);
        }

        String? data = await _appStorage.getData(AppConstant.user);
        String? pass = await _appStorage.getData(AppConstant.password);
        if (data != null) {
          UserJson json = UserJson.fromJson(jsonDecode(data));
          Map<String, dynamic> auth = {
            "identifier": json.email,
            "password": pass
          };
          UserJson? user = await _authRepository.signIn(auth);
          if (user != null) {
            Routes.navigateToAndRemoveUntil(AppPath.mainScreen, {});
          }
        } else {
          AppStorage appStorage = AppStorage();
          String? deepLink = await appStorage.getData(AppConstant.deeplink);
          if (deepLink != null) {
            Routes.navigateToAndRemoveUntil(AppPath.settingChangePassword,
                {AppConstant.data: PasswordMode.reset});
          } else {
            Routes.navigateToAndRemoveUntil(AppPath.signInScreen, {});
          }
        }
      } on NetworkException catch (e) {
        AppLogger.loggerOnNetworkException(e);
      }
    }
  }
}
