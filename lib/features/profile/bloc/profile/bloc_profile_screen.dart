import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

import 'bloc_profile_event.dart';
import 'bloc_profile_state.dart';

class BlocProfileScreen extends Bloc<BlocProfileEvent, BlocProfileState> {
  BlocProfileScreen() : super(BlocProfileStateInitial()) {
    on<BlocProfileEvent>(mapStateToEvent, transformer: restartable());
  }

  Future<void> mapStateToEvent(
      BlocProfileEvent event, Emitter<BlocProfileState> emit) async {
    if (event is BlocProfileEventShowMoreMyPhotos) {
      Routes.navigateTo(AppPath.myPhotos, {});
    } else if (event is BlocProfileEventShowMyJourneys) {
      Routes.navigateTo(AppPath.myJourneys, {});
    }
  }
}
