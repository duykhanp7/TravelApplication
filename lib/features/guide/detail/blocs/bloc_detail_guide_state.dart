import 'package:equatable/equatable.dart';
import 'package:video_viewer/domain/entities/video_source.dart';

abstract class BlocDetailGuideState extends Equatable {}

class BlocDetailGuideStateInitial extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideStateLoadVideoSuccess extends BlocDetailGuideState {
  BlocDetailGuideStateLoadVideoSuccess({required this.source});
  final Map<String, VideoSource> source;
  @override
  List<Object?> get props => [source.values];
}

class BlocDetailGuideStateLoadVideoFailure extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideStateClose extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideStateRegisterFail extends BlocDetailGuideState {
  BlocDetailGuideStateRegisterFail({required this.textError});
  final String textError;
  @override
  List<Object?> get props => [];
}
