import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocSplashState extends Equatable {}

class BlocSplashStateInitial extends BlocSplashState {
  @override
  List<Object?> get props => [];
}

class BlocSplashStateRequestPermissionResult extends BlocSplashState {
  BlocSplashStateRequestPermissionResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
