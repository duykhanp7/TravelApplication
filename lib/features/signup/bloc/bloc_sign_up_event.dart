import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class BlocSignUpEvent extends Equatable {}

class BlocSignUpEventInitial extends BlocSignUpEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpEventValidate extends BlocSignUpEvent {
  final GlobalKey<FormState> signUpGlobalKey;
  BlocSignUpEventValidate({required this.signUpGlobalKey});
  @override
  List<Object?> get props => [];
}

class BlocSignUpEventSignInClick extends BlocSignUpEvent {
  @override
  List<Object?> get props => [];
}
