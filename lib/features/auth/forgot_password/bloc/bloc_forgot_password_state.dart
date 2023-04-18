import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/base/result.dart';

abstract class BlocForgotPasswordState extends Equatable {}

class BlocForgotPasswordStateInitial extends BlocForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class BlocForgotPasswordStateResult extends BlocForgotPasswordState {
  BlocForgotPasswordStateResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
