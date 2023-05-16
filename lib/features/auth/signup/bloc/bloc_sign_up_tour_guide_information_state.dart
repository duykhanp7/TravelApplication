import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/model/result.dart';
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

class BlocSignUpTourGuideInformationStatePickProfileImage
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickProfileImage(
      {required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocSignUpTourGuideInformationStatePickGuideLicenseImage
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickGuideLicenseImage(
      {required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocSignUpTourGuideInformationStatePickIdentityCardImage
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStatePickIdentityCardImage(
      {required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
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

class BlocSignUpTourGuideInformationStateRegisterResult
    extends BlocSignUpTourGuideInformationState {
  BlocSignUpTourGuideInformationStateRegisterResult({required this.appResult});

  final AppResult appResult;

  @override
  List<Object?> get props => [appResult];
}
