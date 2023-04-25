import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/local/app_storage.dart';
import 'dart:developer' as dev;

class DioInterceptor extends Interceptor {
  final AppStorage _appStorage = AppStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await _appStorage.getData(AppConstant.token);
    if (token != null && token.isNotEmpty) {
      debugPrint('Token : $token');
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['token'] = token;
    }
    options.headers['Content-Type'] = 'application/json';
    logPrint(options.path.toString(), type: 0);
    logPrint(options.queryParameters.toString(), type: 0);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint(response.toString(), type: 1);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logPrint(err.response.toString(), type: 2);
    super.onError(err, handler);
  }

  /// [type] color log only supported in VS Code
  /// - 0 request
  /// - 1 reponse
  /// - 2 error
  static void logPrint(String message, {int type = 0}) {
    switch (type) {
      case 0:
        dev.log('\x1B[33m$message', name: 'DioConnect');
        break;
      case 1:
        dev.log('\x1B[32m$message', name: 'DioConnect');
        break;
      case 2:
        dev.log('\x1B[31m$message', name: 'DioConnect');
        break;
      default:
        dev.log(message, name: 'DioConnect');
    }
  }
}
