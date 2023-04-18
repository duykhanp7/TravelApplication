import 'package:equatable/equatable.dart';

abstract class BlocChangePasswordEvent extends Equatable {}

class BlocChangePasswordEventInitial extends BlocChangePasswordEvent {
  @override
  List<Object?> get props => [];
}

class BlocChangePasswordEventChangeCurrentPassword
    extends BlocChangePasswordEvent {
  BlocChangePasswordEventChangeCurrentPassword({required this.currentPassword});
  final String currentPassword;
  @override
  List<Object?> get props => [currentPassword];
}

class BlocChangePasswordEventChangeNewPassword extends BlocChangePasswordEvent {
  BlocChangePasswordEventChangeNewPassword({required this.newPassword});
  final String newPassword;
  @override
  List<Object?> get props => [newPassword];
}

class BlocChangePasswordEventChangeRetypeNewPassword
    extends BlocChangePasswordEvent {
  BlocChangePasswordEventChangeRetypeNewPassword(
      {required this.retypePassword});
  final String retypePassword;
  @override
  List<Object?> get props => [retypePassword];
}

class BlocChangePasswordEventClickButtonSave extends BlocChangePasswordEvent {
  BlocChangePasswordEventClickButtonSave();
  @override
  List<Object?> get props => [];
}
