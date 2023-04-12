import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:travel_booking_tour/features/setting/bloc/bloc_setting_event.dart';
import 'package:travel_booking_tour/features/setting/bloc/bloc_setting_state.dart';

class BlocSettingScreen extends Bloc<BlocSettingEvent, BlocSettingState> {
  BlocSettingScreen() : super(BlocSettingStateInitial()) {
    on<BlocSettingEvent>(mapStateToEvent, transformer: restartable());
  }

  void mapStateToEvent(
      BlocSettingEvent event, Emitter<BlocSettingState> emit) async {}
}
