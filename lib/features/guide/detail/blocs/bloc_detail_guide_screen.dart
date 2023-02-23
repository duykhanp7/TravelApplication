import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_detail_guide_event.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_detail_guide_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';
import 'package:video_viewer/domain/entities/video_source.dart';

class BlocDetailGuideScreen
    extends Bloc<BlocDetailGuideEvent, BlocDetailGuideState> {
  BlocDetailGuideScreen() : super(BlocDetailGuideStateInitial()) {
    on<BlocDetailGuideEvent>((event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(
      BlocDetailGuideEvent event, Emitter<BlocDetailGuideState> emit) async {
    if (event is BlocDetailGuideEventLoadVideo) {
      final source =
          VideoSource.fromNetworkVideoSources({'video': event.videoUrl});
      await Future.delayed(
          const Duration(seconds: 2),
          () => {
                emit(BlocDetailGuideStateLoadVideoSuccess(
                    source: Map.from(source)))
              });
    }
    if (event is BlocDetailGuideEventClose) {
      emit(BlocDetailGuideStateClose());
      Routes.backTo();
    }

    if (event is BlocDetailGuideEventChooseThisGuide) {
      Routes.navigateTo(AppPath.chooseGuideTripInformation, {});
    }
  }
}
