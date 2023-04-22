import 'package:equatable/equatable.dart';

abstract class BlocEditProfileEvent extends Equatable {}

class BlocEditProfileEventInitial extends BlocEditProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocEditProfileEventChangeFirstName extends BlocEditProfileEvent {
  BlocEditProfileEventChangeFirstName({required this.firstName});
  final String firstName;
  @override
  List<Object?> get props => [firstName];
}

class BlocEditProfileEventChangeLastName extends BlocEditProfileEvent {
  BlocEditProfileEventChangeLastName({required this.lastName});
  final String lastName;
  @override
  List<Object?> get props => [lastName];
}

class BlocEditProfileEventClickButtonChangePassword
    extends BlocEditProfileEvent {
  @override
  List<Object?> get props => [];
}

class BlocEditProfileEventClickButtonSaveChange extends BlocEditProfileEvent {
  @override
  List<Object?> get props => [];
}
