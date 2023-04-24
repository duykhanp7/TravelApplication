import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';

abstract class BlocMyJourneysState extends Equatable {}

class BlocMyJourneysStateInitial extends BlocMyJourneysState {
  @override
  List<Object?> get props => [];
}

class BlocMyJourneysStateAddJourney extends BlocMyJourneysState {
  BlocMyJourneysStateAddJourney({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocMyJourneysStateUploadFileOrNot extends BlocMyJourneysState {
  BlocMyJourneysStateUploadFileOrNot({required this.files});
  final List<String>? files;
  @override
  List<Object?> get props => [files];
}
