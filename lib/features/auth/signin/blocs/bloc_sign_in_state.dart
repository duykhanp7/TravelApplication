import 'package:equatable/equatable.dart';

abstract class BlocSignInState extends Equatable {}

class BlocSignInStateInitial extends BlocSignInState {
  @override
  List<Object?> get props => [];
}

class BlocSignInStateValidateSuccess extends BlocSignInState {
  @override
  List<Object?> get props => [];
}

class BlocSignInStateValidateFail extends BlocSignInState {
  @override
  List<Object?> get props => [];
}

class BlocSignInStateValidateLoading extends BlocSignInState {
  @override
  List<Object?> get props => [];
}

class BlocSignInStateServerError extends BlocSignInState {
  @override
  List<Object?> get props => [];
}
