import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_event.dart';
import 'package:travel_booking_tour/features/guide/detail/bloc/bloc_detail_guide_state.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';
import 'package:video_viewer/domain/entities/video_source.dart';

class BlocDetailGuideScreen
    extends Bloc<BlocDetailGuideEvent, BlocDetailGuideState> {
  BlocDetailGuideScreen() : super(BlocDetailGuideStateInitial()) {
    on<BlocDetailGuideEventBack>((event, emit) {
      Routes.backTo();
    });
    on<BlocDetailGuideEventLoadVideo>((event, emit) async {
      final source =
          VideoSource.fromNetworkVideoSources({'video': event.videoUrl});
      emit(BlocDetailGuideStateLoadVideoSuccess(
          current: DateTime.now().millisecond, source: Map.from(source)));
    });
    on<BlocDetailGuideEventClose>(
        (event, emit) => emit(BlocDetailGuideStateClose()));
    on<BlocDetailGuideEventChooseThisGuide>((event, emit) {
      Routes.navigateTo(AppPath.chooseGuideTripInformation, {});
    });
  }
}
