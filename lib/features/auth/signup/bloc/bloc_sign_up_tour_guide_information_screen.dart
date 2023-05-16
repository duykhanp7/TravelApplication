import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:travel_booking_tour/common/app_logger.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/data/model/user.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/auth/repository/auth_repository.dart';
import 'package:travel_booking_tour/features/auth/signup/bloc/bloc_sign_up_tour_guide_information_event.dart';
import 'package:travel_booking_tour/features/auth/signup/bloc/bloc_sign_up_tour_guide_information_state.dart';
import "package:path/path.dart" as p;
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';
import 'package:video_viewer/video_viewer.dart';

import '../../../../common/app_constant.dart';
import '../../../../common/enum/enums.dart';
import '../../../../data/local/app_storage.dart';
import '../../../../data/model/time_from_to.dart';
import '../../../profile/repository/profile_repository.dart';

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
  Map<String, String> fees = {};

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

  final AuthRepository _authRepository = AuthRepository();
  final ProfileRepository _profileRepository = ProfileRepository();
  final AppStorage _appStorage = AppStorage();

  Map<String, dynamic>? dataAccount;

  BlocSignUpTourGuideInformationScreen()
      : super(BlocSignUpTourGuideInformationStateInitial()) {
    on<BlocSignUpTourGuideInformationEvent>(mapStateToEvent,
        transformer: restartable());
  }

  void mapStateToEvent(BlocSignUpTourGuideInformationEvent event,
      Emitter<BlocSignUpTourGuideInformationState> emit) async {
    emitter = emit;
    if (event is BlocSignUpTourGuideInformationEventChangeStep) {
      try {
        if (signUpTourGuideInformationGlobalKey.currentState != null) {
          if (signUpTourGuideInformationGlobalKey.currentState?.validate() ??
              false) {
            currentIndexStep = event.step;
            emit(BlocSignUpTourGuideInformationStateChangeStep(
                step: currentIndexStep));
          } else {
            if (imageProfile == null) {
              emit(BlocSignUpTourGuideInformationStatePickProfileImage(
                  appResult: AppResult(state: ResultState.error)));
            }
            if (imageGuideLicense == null) {
              emit(BlocSignUpTourGuideInformationStatePickGuideLicenseImage(
                  appResult: AppResult(state: ResultState.error)));
            }
            if (imageIdentityCard == null) {
              emit(BlocSignUpTourGuideInformationStatePickIdentityCardImage(
                  appResult: AppResult(state: ResultState.error)));
            }
            if (videoIntroduction == null) {
              emit(BlocSignUpTourGuideInformationStatePickVideoDone(
                  source: null));
            }
          }
        }
      } on NetworkException catch (ex) {
        debugPrint('Sign Up Guide Information Excepytion : $ex');
      }
    } else if (event is BlocSignUpTourGuideInformationEventFinishAddInfo) {
      if (signUpTourGuideInformationGlobalKey.currentState?.validate() ??
          false) {
        emit(BlocSignUpTourGuideInformationStateRegisterResult(
            appResult: AppResult(state: ResultState.loading)));

        try {
          dataAccount?['country'] = country;
          debugPrint(
              'license paht : ${imageGuideLicense?.path ?? 'Empty Path'}');
          UserJson? guideUser = await _authRepository.signUp(dataAccount ?? {});
          if (guideUser != null) {
            Map<String, dynamic> availableTimeList = {};
            await Future.delayed(Duration.zero, () {
              mapTimes.forEach((key, value) {
                availableTimeList[key.name] = value.toJson();
              });
            });

            String availableTime = jsonEncode(availableTimeList);

            Map<String, dynamic> fees = {
              'fee13': fee13,
              'fee46': fee46,
              'fee79': fee79,
              'fee1014': fee1014,
            };

            String feeJson = jsonEncode(fees);

            debugPrint('Feee Json : $feeJson');

            Map<String, dynamic> info = {
              "user": guideUser.id,
              "file":
                  await MultipartFile.fromFile(videoIntroduction?.path ?? ''),
              "language": languages,
              "city": city,
              "address": address,
              "phone": phoneNumber,
              "Introduction": introduction,
              "traveler": fees,
              "availabletime": availableTime,
              "fee": feeJson,
              "license":
                  await MultipartFile.fromFile(imageGuideLicense?.path ?? ''),
              "card":
                  await MultipartFile.fromFile(imageIdentityCard?.path ?? '')
            };

            await _profileRepository.updateAvatar(
                File(imageProfile?.path ?? ''),
                UserType.guide,
                guideUser.id ?? 0);

            await _authRepository.addInformationGuide(info);
            emit(BlocSignUpTourGuideInformationStateRegisterResult(
                appResult: AppResult(state: ResultState.success)));

            Routes.backToUntilPage(AppPath.signInScreen);

            Map<String, dynamic> dataSignIn = {
              "identifier": dataAccount?['email'],
              "password": dataAccount?['password']
            };

            debugPrint(
                'Email Password : ${dataAccount?['email']} ${dataAccount?['password']}');

            UserJson? userJson = await _authRepository.signIn(dataSignIn);
            if (userJson != null) {
              String json = jsonEncode(userJson);
              _appStorage.saveData(AppConstant.user, json);
              _appStorage.saveData(
                  AppConstant.password, dataAccount?['password']);

              Routes.navigateToAndRemoveUntil(AppPath.mainScreen, {});
            }
          }
        } on NetworkException catch (e) {
          emit(BlocSignUpTourGuideInformationStateRegisterResult(
              appResult: AppResult(state: ResultState.fail)));

          AppLogger.loggerOnNetworkException(e);
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
        if (timeFromTo.timeFrom != null) {
          textEditingControllerTimeFrom.text = timeFromTo.timeFrom!;
        }
        if (timeFromTo.timeTo != null) {
          textEditingControllerTimeTo.text = timeFromTo.timeTo!;
        }
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
        fees['fee13'] = fee13;
      } else if (event.quantityTraveler ==
          QuantityTraveler.fourToSixTravelers) {
        fee46 = event.fee;
        fees['fee46'] = fee46;
      } else if (event.quantityTraveler ==
          QuantityTraveler.sevenToNineTravelers) {
        fee79 = event.fee;
        fees['fee79'] = fee79;
      } else if (event.quantityTraveler ==
          QuantityTraveler.tenToFourteenTravelers) {
        fee1014 = event.fee;
        fees['fee1014'] = fee1014;
      }
    } else if (event
        is BlocSignUpTourGuideInformationEventPickGuideLicenseImage) {
      Routes.cameraType = CameraOrRecorder.camera;
      XFile? xFile = await Routes.navigateToCamera();
      await checkImage(emit, TypePickImage.imageGuideLicense, xFile);
    } else if (event
        is BlocSignUpTourGuideInformationEventRemoveGuideLicenseImage) {
      imageGuideLicense = null;
      emit(BlocSignUpTourGuideInformationStatePickGuideLicenseImage(
          appResult: AppResult(state: ResultState.error, result: null)));
    } else if (event
        is BlocSignUpTourGuideInformationEventRemoveIdentityCardImage) {
      imageIdentityCard = null;
      emit(BlocSignUpTourGuideInformationStatePickIdentityCardImage(
          appResult: AppResult(state: ResultState.error, result: null)));
    } else if (event is BlocSignUpTourGuideInformationEventRemoveProfileImage) {
      imageProfile = null;
      emit(BlocSignUpTourGuideInformationStatePickProfileImage(
          appResult: AppResult(state: ResultState.error)));
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

  void setDataAccount(Map<String, dynamic> temp) {
    dataAccount = temp;
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
    dataAccount = null;
  }

  Future<void> checkImage(Emitter<BlocSignUpTourGuideInformationState> emit,
      TypePickImage typePickImage, XFile? xFile) async {
    try {
      if (xFile != null) {
        final extension = p.extension(xFile.path);
        if (extension == '.jpg' || extension == '.png') {
          if (typePickImage == TypePickImage.imageProfile) {
            imageProfile = xFile;
            emit(BlocSignUpTourGuideInformationStatePickProfileImage(
                appResult:
                    AppResult(state: ResultState.success, result: xFile)));
          } else if (typePickImage == TypePickImage.imageGuideLicense) {
            imageGuideLicense = xFile;
            emit(BlocSignUpTourGuideInformationStatePickGuideLicenseImage(
                appResult:
                    AppResult(state: ResultState.success, result: xFile)));
          } else if (typePickImage == TypePickImage.imageIdentityCard) {
            imageIdentityCard = xFile;
            emit(BlocSignUpTourGuideInformationStatePickIdentityCardImage(
                appResult:
                    AppResult(state: ResultState.loading, result: xFile)));
          }
        } else {
          emit(BlocSignUpTourGuideInformationStatePickWrongFormat(
              current: DateTime.now().millisecond));
        }
      }
    } catch (e) {
      if (typePickImage == TypePickImage.imageProfile) {
        emit(BlocSignUpTourGuideInformationStatePickProfileImage(
            appResult:
                AppResult(state: ResultState.fail, result: imageProfile)));
      } else if (typePickImage == TypePickImage.imageGuideLicense) {
        emit(BlocSignUpTourGuideInformationStatePickGuideLicenseImage(
            appResult:
                AppResult(state: ResultState.fail, result: imageGuideLicense)));
      } else if (typePickImage == TypePickImage.imageIdentityCard) {
        emit(BlocSignUpTourGuideInformationStatePickIdentityCardImage(
            appResult:
                AppResult(state: ResultState.fail, result: imageIdentityCard)));
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
