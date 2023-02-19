import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_event.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_state.dart';
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
    if (event is BlocDetailGuideEventInitial) {
      Routes.backTo();
    }
    if (event is BlocDetailGuideEventLoadVideo) {
      final source =
          VideoSource.fromNetworkVideoSources({'video': event.videoUrl});
      emit(BlocDetailGuideStateLoadVideoSuccess(
          current: DateTime.now().millisecond, source: Map.from(source)));
    }
    if (event is BlocDetailGuideEventClose) {
      Routes.backTo();
    }
    if (event is BlocDetailGuideEventChooseThisGuide) {
      Routes.navigateTo(AppPath.chooseGuideTripInformation, {});
    }
  }
}
