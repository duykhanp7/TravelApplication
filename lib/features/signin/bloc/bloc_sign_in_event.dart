import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class BlocSignInEvent extends Equatable {}

class BlocSignInEventInitial extends BlocSignInEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignInEventSignInClick extends BlocSignInEvent {
  final GlobalKey<FormState> signInGlobalKey;
  BlocSignInEventSignInClick({required this.signInGlobalKey});
  @override
  List<Object?> get props => [];
}

class BlocSignInEventSignUpClick extends BlocSignInEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignInEventForgotPassword extends BlocSignInEvent {
  @override
  List<Object?> get props => [];
}
