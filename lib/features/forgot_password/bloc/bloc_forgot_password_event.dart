import 'package:equatable/equatable.dart';

abstract class BlocForgotPasswordEvent extends Equatable {}

class BlocForgotPasswordEventInitial extends BlocForgotPasswordEvent {
  @override
  List<Object?> get props => [];
}

class BlocForgotPasswordEventSendEmailClick extends BlocForgotPasswordEvent {
  BlocForgotPasswordEventSendEmailClick();
  @override
  List<Object?> get props => [];
}

class BlocForgotPasswordEventSignInClick extends BlocForgotPasswordEvent {
  @override
  List<Object?> get props => [];
}
