import 'package:flutter/widgets.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';

class AppLogger {
  static void loggerOnNetworkException(NetworkException exception) {
    debugPrint(
        'loggerOnNetworkException ${exception.runtimeType} ${exception.getTextError} ${exception.statusCode}');
  }
}
