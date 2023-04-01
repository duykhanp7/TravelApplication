import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_viewer/domain/entities/video_source.dart';

abstract class BlocSignUpTourGuideInformationState extends Equatable {}

class BlocSignUpTourGuideInformationStateInitial
    extends BlocSignUpTourGuideInformationState {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationStateChangeIndexDate
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStateChangeIndexDate({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class BlocSignUpTourGuideInformationStateChangeStep
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStateChangeStep({required this.step});
  final int step;
  @override
  List<Object?> get props => [step];
}

class BlocSignUpTourGuideInformationStatePickProfileImageSuccess
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickProfileImageSuccess(
      {required this.file});
  final XFile file;
  @override
  List<Object?> get props => [file];
}

class BlocSignUpTourGuideInformationStatePickProfileImageFail
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickProfileImageFail(
      {required this.previousImagePicked});
  final XFile? previousImagePicked;
  @override
  List<Object?> get props => [previousImagePicked];
}

class BlocSignUpTourGuideInformationStatePickGuideLicenseImageSuccess
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickGuideLicenseImageSuccess(
      {required this.file});
  final XFile file;
  @override
  List<Object?> get props => [file];
}

class BlocSignUpTourGuideInformationStatePickGuideLicenseImageFail
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickGuideLicenseImageFail(
      {required this.previousImagePicked});
  final XFile? previousImagePicked;
  @override
  List<Object?> get props => [previousImagePicked];
}

class BlocSignUpTourGuideInformationStatePickIdentityCardImageSuccess
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickIdentityCardImageSuccess(
      {required this.file});
  final XFile file;
  @override
  List<Object?> get props => [file];
}

class BlocSignUpTourGuideInformationStatePickIdentityCardImageFail
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickIdentityCardImageFail(
      {required this.previousImagePicked});
  final XFile? previousImagePicked;
  @override
  List<Object?> get props => [previousImagePicked];
}

class BlocSignUpTourGuideInformationStatePickVideoDone
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickVideoDone({required this.source});
  final Map<String, VideoSource>? source;
  @override
  List<Object?> get props => [source];
}

class BlocSignUpTourGuideInformationStatePickWrongFormat
    extends BlocSignUpTourGuideInformationState {
  final int current;
  BlocSignUpTourGuideInformationStatePickWrongFormat({required this.current});
  @override
  List<Object?> get props => [current];
}

class BlocSignUpTourGuideInformationStateClose
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStateClose();
  @override
  List<Object?> get props => [];
}
