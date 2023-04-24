import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocForgotPasswordState extends Equatable {}

class BlocForgotPasswordStateInitial extends BlocForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class BlocChangePasswordStateSendEmailResult extends BlocForgotPasswordState {
  BlocChangePasswordStateSendEmailResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
