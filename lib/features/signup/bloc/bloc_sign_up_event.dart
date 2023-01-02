import 'package:equatable/equatable.dart';

abstract class BlocSignUpEvent extends Equatable {}

class BlocSignUpEventInitial extends BlocSignUpEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpEventValidate extends BlocSignUpEvent {
  @override
  List<Object?> get props => [];
}
