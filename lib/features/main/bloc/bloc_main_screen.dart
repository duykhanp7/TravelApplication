import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:travel_booking_tour/common/get_location.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_event.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_main_state.dart';
import 'package:travel_booking_tour/features/main/model/unsplash_image_json.dart';
import 'package:travel_booking_tour/features/main/repository/main_repository.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

class BlocMainScreen extends Bloc<BlocMainEvent, BlocMainState> {
  int index = 0;
  String? currentLocationName = 'Hồ Chí Minh';
  double? currentLocationTemperature = 0;
  UnSplashResponeJson? unSplashResponeJson;
  UnSplashURL? unSplashURL;
  final MainRepository _mainRepository = MainRepository();

  BlocMainScreen() : super(BlocMainStateInitial()) {
    on<BlocMainEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(BlocMainEvent event, Emitter<BlocMainState> emit) async {
    if (event is BlocMainEventInitial) {
      index = 0;

      //Get current position name
      currentLocationName = await _mainRepository.getCurrentLocationName();
      //Get current position temperature
      currentLocationTemperature = await _mainRepository
          .getCurrentTemperature(await GetLocation.getGeoLocationPosition());
      //Get image of current position, default is in Ho Chi Minh City
      // unSplashResponeJson = await _mainRepository
      //     .getCurrentPostitionImage(currentLocationName ?? 'Hồ Chí Minh');

      unSplashURL = unSplashResponeJson?.results?[0].urls;

      emit(BlocMainStateChangeTabIndex(index: 0));
    } else if (event is BlocMainEventChangeTabIndex) {
      index = event.index;
      emit(BlocMainStateChangeTabIndex(index: event.index));
    } else if (event is BlocMainEventSearchSystemClick) {
      Routes.navigateTo(AppPath.searchSystem, {});
    }
  }
}
