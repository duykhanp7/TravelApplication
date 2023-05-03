import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/common/app_constant.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_event.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';
import 'package:video_viewer/video_viewer.dart';

import '../../../../common/enum/enums.dart';
import '../../../../data/model/tour_guide_detail_json.dart';

class BlocDetailGuideScreen
    extends Bloc<BlocDetailGuideEvent, BlocDetailGuideState> {
  BlocDetailGuideScreen() : super(BlocDetailGuideStateInitial()) {
    on<BlocDetailGuideEvent>(mapStateToEvent, transformer: restartable());
  }

  final VideoViewerController videoViewerController = VideoViewerController();
  TourGuideDetailJson? tourGuideDetailJson;
  bool isLoading = false;

  void mapStateToEvent(
      BlocDetailGuideEvent event, Emitter<BlocDetailGuideState> emit) async {
    if (event is BlocDetailGuideEventInitial) {
      isLoading = false;
      try {
        if (!isLoading) {
          isLoading = true;
          emit(BlocDetailGuideStateLoadDataResult(
              appResult: AppResult(state: ResultState.loading)));
          await Future.delayed(const Duration(seconds: 4), () {
            isLoading = false;
            emit(BlocDetailGuideStateLoadDataResult(
                appResult: AppResult(
                    state: ResultState.success, result: tourGuideDetailJson)));
          });
        }
      } on NetworkException catch (e) {
        isLoading = false;
        debugPrint(
            'Exception BlocDetailGuideStateLoadDataResult : ${e.toString()}');
        emit(BlocDetailGuideStateLoadDataResult(
            appResult: AppResult(state: ResultState.fail)));
      }
    } else if (event is BlocDetailGuideEventClose) {
      emit(BlocDetailGuideStateClose());
      Routes.backTo();
    } else if (event is BlocDetailGuideEventChooseThisGuide) {
      Routes.navigateTo(AppPath.editTripInformation, {
        AppConstant.tripInformationMode:
            EditTripInformationMode.editTripInformation
      });
    }
  }

  void setTourGuideDetailJson(TourGuideDetailJson tourGuide) {
    tourGuideDetailJson = tourGuide;
  }
}
