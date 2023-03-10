import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:travel_booking_tour/common/enums/enums.dart';
import 'package:travel_booking_tour/data/models/time_from_to.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_tour_guide_information_event.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_tour_guide_information_state.dart';
import "package:path/path.dart" as p;
import 'package:travel_booking_tour/router/routes.dart';
import 'package:video_viewer/video_viewer.dart';

class BlocSignUpTourGuideInformationScreen extends Bloc<
    BlocSignUpTourGuideInformationEvent, BlocSignUpTourGuideInformationState> {
  int currentIndexDate = 0;
  int currentIndexStep = 0;

  String address = '';
  String city = '';
  String country = '';
  String phoneNumber = '';
  String languages = '';
  String introduction = '';
  String fee13 = '0';
  String fee46 = '0';
  String fee79 = '0';
  String fee1014 = '0';

  XFile? imageProfile;
  XFile? imageGuideLicense;
  XFile? imageIdentityCard;
  XFile? videoIntroduction;

  TextEditingController textEditingControllerAddress = TextEditingController();
  TextEditingController textEditingControllerCity = TextEditingController();
  TextEditingController textEditingControllerCountry = TextEditingController();
  TextEditingController textEditingControllerPhoneNumber =
      TextEditingController();
  TextEditingController textEditingControllerLanguages =
      TextEditingController();
  TextEditingController textEditingControllerIntroduction =
      TextEditingController();

  TextEditingController textEditingControllerTimeFrom = TextEditingController();
  TextEditingController textEditingControllerTimeTo = TextEditingController();
  TextEditingController textEditingControllerFee13 = TextEditingController();
  TextEditingController textEditingControllerFee46 = TextEditingController();
  TextEditingController textEditingControllerFee79 = TextEditingController();
  TextEditingController textEditingControllerFee1014 = TextEditingController();

  VideoViewerController videoViewerController = VideoViewerController();

  Emitter<BlocSignUpTourGuideInformationState>? emitter;

  Map<DateInWeek, TimeFromTo> mapTimes = {};
  DateInWeek dateInWeek = DateInWeek.monday;

  final GlobalKey<FormState> signUpTourGuideInformationGlobalKey =
      GlobalKey<FormState>();

  BlocSignUpTourGuideInformationScreen()
      : super(BlocSignUpTourGuideInformationStateInitial()) {
    on<BlocSignUpTourGuideInformationEvent>(
        (event, emit) async => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(BlocSignUpTourGuideInformationEvent event,
      Emitter<BlocSignUpTourGuideInformationState> emit) async {
    emitter = emit;
    if (event is BlocSignUpTourGuideInformationEventChangeStep) {
      currentIndexStep = event.step;
      if (signUpTourGuideInformationGlobalKey.currentState != null) {
        if (signUpTourGuideInformationGlobalKey.currentState!.validate()) {
          emit(BlocSignUpTourGuideInformationStateChangeStep(
              step: currentIndexStep));
        }
      }
    } else if (event
        is BlocSignUpTourGuideInformationEventChangeIndexDateClick) {
      currentIndexDate = event.index;
      dateInWeek = DateInWeek.values.elementAt(event.index);

      textEditingControllerTimeFrom.text = '';
      textEditingControllerTimeTo.text = '';

      TimeFromTo? timeFromTo = mapTimes[dateInWeek];
      if (timeFromTo != null) {
        debugPrint('Time From To Not Null');
        if (timeFromTo.timeFrom != null) {
          textEditingControllerTimeFrom.text = timeFromTo.timeFrom!;
        }
        if (timeFromTo.timeTo != null) {
          textEditingControllerTimeTo.text = timeFromTo.timeTo!;
        }
      } else {
        debugPrint('Nulllllllllll');
      }

      emit(BlocSignUpTourGuideInformationStateChangeIndexDate(
          index: event.index));
    } else if (event is BlocSignUpTourGuideInformationEventChangeAddress) {
      address = event.address;
    } else if (event is BlocSignUpTourGuideInformationEventChangeCity) {
      city = event.city;
    } else if (event is BlocSignUpTourGuideInformationEventChangeCountry) {
      country = event.country;
    } else if (event is BlocSignUpTourGuideInformationEventChangePhoneNumber) {
      phoneNumber = event.phoneNumber;
    } else if (event is BlocSignUpTourGuideInformationEventChangeLanguages) {
      languages = event.languages;
    } else if (event is BlocSignUpTourGuideInformationEventChangeIntroduction) {
      introduction = event.introduction;
    } else if (event is BlocSignUpTourGuideInformationEventPickProfileImage) {
      Routes.cameraType = CameraOrRecorder.camera;
      XFile? xFile = await Routes.navigateToCamera();
      await checkImage(emit, TypePickImage.imageProfile, xFile);
    } else if (event is BlocSignUpTourGuideInformationEventChangeTimeFrom) {
      TimeFromTo? timeFromTo = mapTimes[dateInWeek];
      if (timeFromTo != null) {
        mapTimes[dateInWeek] = timeFromTo.copyWith(timeFrom: event.timeFrom);
      } else {
        mapTimes[dateInWeek] = TimeFromTo(timeFrom: event.timeFrom);
      }
    } else if (event is BlocSignUpTourGuideInformationEventChangeTimeTo) {
      TimeFromTo? timeFromTo = mapTimes[dateInWeek];
      if (timeFromTo != null) {
        mapTimes[dateInWeek] = timeFromTo.copyWith(timeTo: event.timeTo);
      } else {
        mapTimes[dateInWeek] = TimeFromTo(timeTo: event.timeTo);
      }
    } else if (event is BlocSignUpTourGuideInformationEventChangeFee) {
      if (event.quantityTraveler == QuantityTraveler.oneToThreeTravelers) {
        fee13 = event.fee;
      } else if (event.quantityTraveler ==
          QuantityTraveler.fourToSixTravelers) {
        fee46 = event.fee;
      } else if (event.quantityTraveler ==
          QuantityTraveler.sevenToNineTravelers) {
        fee79 = event.fee;
      } else if (event.quantityTraveler ==
          QuantityTraveler.tenToFourteenTravelers) {
        fee1014 = event.fee;
      }
    } else if (event
        is BlocSignUpTourGuideInformationEventPickGuideLicenseImage) {
      Routes.cameraType = CameraOrRecorder.camera;
      XFile? xFile = await Routes.navigateToCamera();
      await checkImage(emit, TypePickImage.imageGuideLicense, xFile);
    } else if (event
        is BlocSignUpTourGuideInformationEventRemoveGuideLicenseImage) {
      imageGuideLicense = null;
      emit(BlocSignUpTourGuideInformationStatePickGuideLicenseImageFail(
          previousImagePicked: null));
    } else if (event
        is BlocSignUpTourGuideInformationEventRemoveIdentityCardImage) {
      imageIdentityCard = null;
      emit(BlocSignUpTourGuideInformationStatePickIdentityCardImageFail(
          previousImagePicked: null));
    } else if (event is BlocSignUpTourGuideInformationEventRemoveProfileImage) {
      imageProfile = null;
      emit(BlocSignUpTourGuideInformationStatePickProfileImageFail(
          previousImagePicked: null));
    } else if (event
        is BlocSignUpTourGuideInformationEventRemoveVideoIntroduction) {
      videoIntroduction = null;
      emit(BlocSignUpTourGuideInformationStatePickVideoDone(source: null));
    } else if (event
        is BlocSignUpTourGuideInformationEventPickIdentityCardImage) {
      Routes.cameraType = CameraOrRecorder.camera;
      XFile? xFile = await Routes.navigateToCamera();
      await checkImage(emit, TypePickImage.imageIdentityCard, xFile);
    } else if (event
        is BlocSignUpTourGuideInformationEventPickVideoIntroduction) {
      Routes.cameraType = CameraOrRecorder.recorder;
      XFile? xFile = await Routes.navigateToCamera();
      Map<String, VideoSource>? source;
      if (xFile != null) {
        videoIntroduction = xFile;
      }
      source = getSourceVideo(xFile);
      emit(BlocSignUpTourGuideInformationStatePickVideoDone(source: source));
    } else if (event is BlocSignUpTourGuideInformationEventClose) {
      emit(BlocSignUpTourGuideInformationStateClose());
    }
  }

  void clearDatas() {
    address = '';
    city = '';
    country = '';
    phoneNumber = '';
    languages = '';
    introduction = '';
    textEditingControllerAddress.text = '';
    textEditingControllerCity.text = '';
    textEditingControllerCountry.text = '';
    textEditingControllerPhoneNumber.text = '';
    textEditingControllerLanguages.text = '';
    textEditingControllerIntroduction.text = '';
    textEditingControllerTimeTo.text = '';
    textEditingControllerTimeFrom.text = '';
    textEditingControllerFee13.text = '';
    textEditingControllerFee46.text = '';
    textEditingControllerFee79.text = '';
    textEditingControllerFee1014.text = '';
    imageProfile = null;
    imageGuideLicense = null;
    imageIdentityCard = null;
    videoIntroduction = null;
  }

  Future<void> checkImage(Emitter<BlocSignUpTourGuideInformationState> emit,
      TypePickImage typePickImage, XFile? xFile) async {
    try {
      if (xFile != null) {
        final extension = p.extension(xFile.path);
        if (extension == '.jpg' || extension == '.png') {
          if (typePickImage == TypePickImage.imageProfile) {
            imageProfile = xFile;
            emit(BlocSignUpTourGuideInformationStatePickProfileImageSuccess(
                file: xFile));
          } else if (typePickImage == TypePickImage.imageGuideLicense) {
            imageGuideLicense = xFile;
            emit(
                BlocSignUpTourGuideInformationStatePickGuideLicenseImageSuccess(
                    file: xFile));
          } else if (typePickImage == TypePickImage.imageIdentityCard) {
            imageIdentityCard = xFile;
            emit(
                BlocSignUpTourGuideInformationStatePickIdentityCardImageSuccess(
                    file: xFile));
          }
        } else {
          emit(BlocSignUpTourGuideInformationStatePickWrongFormat(
              current: DateTime.now().millisecond));
        }
      }
    } catch (e) {
      if (typePickImage == TypePickImage.imageProfile) {
        emit(BlocSignUpTourGuideInformationStatePickProfileImageFail(
            previousImagePicked: imageProfile));
      } else if (typePickImage == TypePickImage.imageGuideLicense) {
        emit(BlocSignUpTourGuideInformationStatePickGuideLicenseImageFail(
            previousImagePicked: imageGuideLicense));
      } else if (typePickImage == TypePickImage.imageIdentityCard) {
        emit(BlocSignUpTourGuideInformationStatePickIdentityCardImageFail(
            previousImagePicked: imageIdentityCard));
      }
    }
  }

  Map<String, VideoSource>? getSourceVideo(XFile? xFile) {
    VideoSource videoSource;
    Map<String, VideoSource>? source;
    if (xFile != null) {
      videoSource =
          VideoSource(video: VideoPlayerController.file(File(xFile.path)));
      source = {'video': videoSource};
    } else {
      if (videoIntroduction != null) {
        videoSource = VideoSource(
            video: VideoPlayerController.file(File(videoIntroduction!.path)));
        source = {'video': videoSource};
      } else {
        source = null;
      }
    }
    return source;
  }

  Future<String> formatStringCurrency(String value) async {
    return "\$${NumberFormat('#,##0', 'en_US').format(value)}";
  }
}
