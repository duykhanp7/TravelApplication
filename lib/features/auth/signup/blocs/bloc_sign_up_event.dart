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

class BlocSignUpEventChangeTypeAccount extends BlocSignUpEvent {
  BlocSignUpEventChangeTypeAccount({required this.typeAccount});
  final int typeAccount;
  @override
  List<Object?> get props => [typeAccount];
}

class BlocSignUpEventChangeFirstName extends BlocSignUpEvent {
  BlocSignUpEventChangeFirstName({required this.firstName});
  final String? firstName;
  @override
  List<Object?> get props => [firstName];
}

class BlocSignUpEventChangeLastName extends BlocSignUpEvent {
  BlocSignUpEventChangeLastName({required this.lastName});
  final String? lastName;
  @override
  List<Object?> get props => [lastName];
}

class BlocSignUpEventChangeCountry extends BlocSignUpEvent {
  BlocSignUpEventChangeCountry({required this.country});
  final String? country;
  @override
  List<Object?> get props => [country];
}

class BlocSignUpEventChangeEmail extends BlocSignUpEvent {
  BlocSignUpEventChangeEmail({required this.email});
  final String? email;
  @override
  List<Object?> get props => [email];
}

class BlocSignUpEventChangePassword extends BlocSignUpEvent {
  BlocSignUpEventChangePassword({required this.password});
  final String? password;
  @override
  List<Object?> get props => [password];
}

class BlocSignUpEventChangeConfirmPassword extends BlocSignUpEvent {
  BlocSignUpEventChangeConfirmPassword({required this.confirmPassword});
  final String? confirmPassword;
  @override
  List<Object?> get props => [confirmPassword];
}

class BlocSignUpEventTermAndConditionsClick extends BlocSignUpEvent {
  @override
  List<Object?> get props => [];
}
