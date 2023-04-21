import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/base/result.dart';

abstract class BlocProfileState extends Equatable {}

class BlocProfileStateInitial extends BlocProfileState {
  @override
  List<Object?> get props => [];
}

class BlocProfileStateLoadUserInforResult extends BlocProfileState {
  BlocProfileStateLoadUserInforResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
