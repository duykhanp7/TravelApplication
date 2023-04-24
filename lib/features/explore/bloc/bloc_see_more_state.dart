import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocSeeMoreState extends Equatable {}

class BlocSeeMoreStateInitial extends BlocSeeMoreState {
  @override
  List<Object?> get props => [];
}

class BlocSeeMoreStateLoadData extends BlocSeeMoreState {
  BlocSeeMoreStateLoadData({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocSeeMoreStateClose extends BlocSeeMoreState {
  @override
  List<Object?> get props => [];
}
