import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocChangePasswordState extends Equatable {}

class BlocChangePasswordStateInitial extends BlocChangePasswordState {
  @override
  List<Object?> get props => [];
}

class BlocChangePasswordStateTokenResetPasswordInvalid
    extends BlocChangePasswordState {
  BlocChangePasswordStateTokenResetPasswordInvalid({required this.time});
  final int time;
  @override
  List<Object?> get props => [time];
}

class BlocChangePasswordStateResult extends BlocChangePasswordState {
  BlocChangePasswordStateResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
