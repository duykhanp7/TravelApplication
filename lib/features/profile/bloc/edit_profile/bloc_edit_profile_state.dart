import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocEditProfileState extends Equatable {}

class BlocEditProfileStateInitial extends BlocEditProfileState {
  @override
  List<Object?> get props => [];
}

class BlocEditProfileStateResult extends BlocEditProfileState {
  BlocEditProfileStateResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
