import 'package:travel_booking_tour/common/enums/enums.dart';

class AppResult<T> {
  final ResultState resultState;
  final T? result;
  AppResult({required this.resultState, required this.result});
}
