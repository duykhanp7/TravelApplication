import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/data/network/network_exception.dart';
import 'package:travel_booking_tour/features/profile/model/user_info.dart';
import 'package:travel_booking_tour/features/profile/repository/profile_repository.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

import 'bloc_profile_event.dart';
import 'bloc_profile_state.dart';

class BlocProfileScreen extends Bloc<BlocProfileEvent, BlocProfileState> {
  BlocProfileScreen() : super(BlocProfileStateInitial()) {
    on<BlocProfileEvent>(mapStateToEvent, transformer: restartable());
  }

  final ProfileRepository _profileRepository = ProfileRepository();

  Future<void> mapStateToEvent(
      BlocProfileEvent event, Emitter<BlocProfileState> emit) async {
    if (event is BlocProfileEventInitial) {
      try {
        final UserInfoJson? userInfoJson =
            await _profileRepository.getUserInfo();
        if (userInfoJson != null) {
          debugPrint('User Information Json : ${userInfoJson.toString()}');
        }
      } on NetworkException catch (e) {
        debugPrint('Exception : ${e.getTextError} ${e.statusCode}');
      }
    } else if (event is BlocProfileEventShowMoreMyPhotos) {
      Routes.navigateTo(AppPath.myPhotos, {});
    } else if (event is BlocProfileEventShowMyJourneys) {
      Routes.navigateTo(AppPath.myJourneys, {});
    }
  }
}
