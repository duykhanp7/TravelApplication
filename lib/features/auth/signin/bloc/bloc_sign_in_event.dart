import 'package:equatable/equatable.dart';

abstract class BlocSignInEvent extends Equatable {}

class BlocSignInEventInitial extends BlocSignInEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignInEventSignInClick extends BlocSignInEvent {
  BlocSignInEventSignInClick();
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

class BlocSignInEventChangeEmail extends BlocSignInEvent {
  BlocSignInEventChangeEmail({required this.email});
  final String email;
  @override
  List<Object?> get props => [];
}

class BlocSignInEventChangePassword extends BlocSignInEvent {
  BlocSignInEventChangePassword({required this.password});
  final String password;
  @override
  List<Object?> get props => [];
}
