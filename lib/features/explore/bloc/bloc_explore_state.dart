import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocExploreState extends Equatable {}

class BlocExploreStateInitial extends BlocExploreState {
  @override
  List<Object?> get props => [];
}

class BlocExploreStateLoadData extends BlocExploreState {
  final AppResult appResult;

  BlocExploreStateLoadData({required this.appResult});

  @override
  List<Object?> get props => [appResult];
}
