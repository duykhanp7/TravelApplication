import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';

abstract class BlocMyPhotosEvent extends Equatable {}

class BlocMyPhotosEventInitial extends BlocMyPhotosEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyPhotosEventClickButtonAddPhoto extends BlocMyPhotosEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyPhotosEventClickButtonTakePhoto extends BlocMyPhotosEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyPhotosEventClickButtonSelectPhotosDone extends BlocMyPhotosEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyPhotosEventRequestPermission extends BlocMyPhotosEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyPhotosEventRequestCameraPermission extends BlocMyPhotosEvent {
  @override
  List<Object?> get props => [];
}

class BlocMyPhotosEventChangeMode extends BlocMyPhotosEvent {
  BlocMyPhotosEventChangeMode({required this.mode});
  final MyPhotosMode mode;
  @override
  List<Object?> get props => [mode];
}

class BlocMyPhotosEventDeleteImage extends BlocMyPhotosEvent {
  BlocMyPhotosEventDeleteImage();
  @override
  List<Object?> get props => [];
}
