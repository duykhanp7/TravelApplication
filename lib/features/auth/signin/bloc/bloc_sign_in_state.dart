import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocSignInState extends Equatable {}

class BlocSignInStateInitial extends BlocSignInState {
  @override
  List<Object?> get props => [];
}

class BlocSignInStateValidate extends BlocSignInState {
  BlocSignInStateValidate({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
