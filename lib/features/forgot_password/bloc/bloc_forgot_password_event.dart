import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class BlocForgotPasswordEvent extends Equatable {}

class BlocForgotPasswordEventInitial extends BlocForgotPasswordEvent {
  @override
  List<Object?> get props => [];
}

class BlocForgotPasswordEventSendEmailClick extends BlocForgotPasswordEvent {
  final GlobalKey<FormState> forgotPasswordGlobalKey;
  BlocForgotPasswordEventSendEmailClick(
      {required this.forgotPasswordGlobalKey});
  @override
  List<Object?> get props => [];
}

class BlocForgotPasswordEventSignInClick extends BlocForgotPasswordEvent {
  @override
  List<Object?> get props => [];
}
