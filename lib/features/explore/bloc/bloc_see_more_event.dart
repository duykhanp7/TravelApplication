import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/common/enums/enums.dart';

abstract class BlocSeeMoreEvent extends Equatable {}

class BlocSeeMoreEventInitial extends BlocSeeMoreEvent {
  BlocSeeMoreEventInitial({required this.seeMoreType});
  final SeeMoreType seeMoreType;
  @override
  List<Object?> get props => [seeMoreType];
}

class BlocSeeMoreEventLoadMore extends BlocSeeMoreEvent {
  BlocSeeMoreEventLoadMore({required this.seeMoreType});
  final SeeMoreType seeMoreType;
  @override
  List<Object?> get props => [seeMoreType];
}

class BlocSeeMoreEventOnItemClick extends BlocSeeMoreEvent {
  BlocSeeMoreEventOnItemClick({required this.seeMoreType, required this.data});
  final SeeMoreType seeMoreType;
  final dynamic data;
  @override
  List<Object?> get props => [];
}
