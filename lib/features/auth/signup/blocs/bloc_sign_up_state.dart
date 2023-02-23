import 'package:equatable/equatable.dart';

abstract class BlocSignUpState extends Equatable {}

class BlocSignUpStateInitial extends BlocSignUpState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpStateValidateSuccess extends BlocSignUpState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpStateValidateFail extends BlocSignUpState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpStateServerError extends BlocSignUpState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpStateValidateLoading extends BlocSignUpState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpStateChangeTypeAccount extends BlocSignUpState {
  BlocSignUpStateChangeTypeAccount({required this.typeAccount});
  final int? typeAccount;
  @override
  List<Object?> get props => [typeAccount];
}
