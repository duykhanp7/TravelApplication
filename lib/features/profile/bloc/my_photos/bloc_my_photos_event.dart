import 'package:equatable/equatable.dart';

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
