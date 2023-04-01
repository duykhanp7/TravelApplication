import 'package:equatable/equatable.dart';

import '../../../base/result.dart';

abstract class BlocMyTripState extends Equatable {}

class BlocMyTripStateInitial extends BlocMyTripState {
  @override
  List<Object?> get props => [];
}

class BlocMyTripStateChangeIndex extends BlocMyTripState {
  BlocMyTripStateChangeIndex({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class BlocMyTripStateLoadCurrentTrips extends BlocMyTripState {
  BlocMyTripStateLoadCurrentTrips({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocMyTripStateLoadNextTrips extends BlocMyTripState {
  BlocMyTripStateLoadNextTrips({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocMyTripStateLoadPastTrips extends BlocMyTripState {
  BlocMyTripStateLoadPastTrips({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocMyTripStateLoadWishListTrips extends BlocMyTripState {
  BlocMyTripStateLoadWishListTrips({required this.appResult});
  final AppResult appResult;

  @override
  List<Object?> get props => [appResult];
}
