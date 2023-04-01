import '../common/enum/enums.dart';

class AppResult<T> {
  final ResultState state;
  final T? result;
  AppResult({required this.state, this.result});
}
