import 'package:equatable/equatable.dart';
import 'package:video_viewer/domain/entities/video_source.dart';

abstract class BlocDetailGuideState extends Equatable {}

class BlocDetailGuideStateInitial extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideStateLoadVideoSuccess extends BlocDetailGuideState {
  BlocDetailGuideStateLoadVideoSuccess(
      {required this.source, required this.current});
  final int current;
  final Map<String, VideoSource> source;
  @override
  List<Object?> get props => [current, source.values];
}

class BlocDetailGuideStateLoadVideoFailure extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}

class BlocDetailGuideStateClose extends BlocDetailGuideState {
  @override
  List<Object?> get props => [];
}
