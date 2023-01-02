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
