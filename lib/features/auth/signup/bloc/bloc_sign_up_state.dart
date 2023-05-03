import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

import '../../../../common/enum/enums.dart';

abstract class BlocSignUpState extends Equatable {}

class BlocSignUpStateInitial extends BlocSignUpState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpStateValidate extends BlocSignUpState {
  BlocSignUpStateValidate({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocSignUpStateChangeTypeAccount extends BlocSignUpState {
  BlocSignUpStateChangeTypeAccount({required this.typeAccount});
  final UserType? typeAccount;
  @override
  List<Object?> get props => [typeAccount];
}
