import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';

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

class BlocMyPhotosStateShowDialogRequestCameraPermission
    extends BlocMyPhotosState {
  BlocMyPhotosStateShowDialogRequestCameraPermission({required this.time});
  final int time;
  @override
  List<Object?> get props => [time];
}

class BlocMyPhotosStateChangeMode extends BlocMyPhotosState {
  BlocMyPhotosStateChangeMode({required this.mode});
  final MyPhotosMode mode;
  @override
  List<Object?> get props => [mode];
}

class BlocMyPhotosStateDeletePhotos extends BlocMyPhotosState {
  BlocMyPhotosStateDeletePhotos({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
