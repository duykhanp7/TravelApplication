import 'package:equatable/equatable.dart';

import '../../../common/enum/enums.dart';

abstract class BlocMyTripEvent extends Equatable {}

class BlocMyTripEventInitial extends BlocMyTripEvent {
  BlocMyTripEventInitial({required this.tabMyList});
  final TabMyList tabMyList;
  @override
  List<Object?> get props => [tabMyList];
}

class BlocMyTripEventChangeIndex extends BlocMyTripEvent {
  BlocMyTripEventChangeIndex({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class BlocMyTripEventLoadCurrentTrip extends BlocMyTripEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyTripEventLoadNextTrip extends BlocMyTripEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyTripEventLoadPastTrip extends BlocMyTripEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyTripEventLoadWishListTrip extends BlocMyTripEvent {
  @override
  List<Object?> get props => [];
}
