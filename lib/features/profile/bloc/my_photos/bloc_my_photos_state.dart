import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/base/result.dart';

abstract class BlocMyPhotosState extends Equatable {}

class BlocMyPhotosStateInitial extends BlocMyPhotosState {
  @override
  List<Object?> get props => [];
}

class BlocMyPhotosStateLoadLocalPhotos extends BlocMyPhotosState {
  BlocMyPhotosStateLoadLocalPhotos({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocMyPhotosStateAddNewPhotos extends BlocMyPhotosState {
  BlocMyPhotosStateAddNewPhotos({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocMyPhotosStateShowDialogRequestPermission extends BlocMyPhotosState {
  BlocMyPhotosStateShowDialogRequestPermission({required this.time});
  final int time;
  @override
  List<Object?> get props => [time];
}
