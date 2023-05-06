import 'package:intl/intl.dart';

extension GenericType<T> on List<T> {
  Type get genericType => T;
}

extension AppDateTime on DateTime {
  String toFormatHHMMSS() {
    return DateFormat('hh-MM-yyyy').format(this);
  }

  String toyMMMdFormat() {
    return DateFormat.yMMMd().format(this);
  }
}
