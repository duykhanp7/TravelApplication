import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocDetailGuideState extends Equatable {}

class BlocDetailGuideStateInitial extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideStateClose extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideStateLoadDataResult extends BlocDetailGuideState {
  BlocDetailGuideStateLoadDataResult({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
