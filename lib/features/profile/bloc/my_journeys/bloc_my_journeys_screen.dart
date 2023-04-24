import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:travel_booking_tour/data/model/result.dart';
import 'package:travel_booking_tour/common/enum/enums.dart';
import 'package:travel_booking_tour/data/model/my_experience_json.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_event.dart';
import 'package:travel_booking_tour/features/profile/bloc/my_journeys/bloc_my_journeys_state.dart';
import 'package:travel_booking_tour/features/profile/repository/profile_repository.dart';

import '../../../../router/path.dart';
import '../../../../router/routes.dart';

class BlocMyJourneysScreen
    extends Bloc<BlocMyJourneysEvent, BlocMyJourneysState> {
  BlocMyJourneysScreen() : super(BlocMyJourneysStateInitial()) {
    on<BlocMyJourneysEvent>(mapStateToEvent, transformer: restartable());
  }

  List<MyExperienceJson> listMyExperienceJson = [];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController journeyNameEditingController =
      TextEditingController();
  final TextEditingController locationOfJourneyEditingController =
      TextEditingController();
  final ProfileRepository _profileRepository = ProfileRepository();
  bool isPhotoLoaded = true;
  List<String>? files;

  void mapStateToEvent(
      BlocMyJourneysEvent event, Emitter<BlocMyJourneysState> emit) async {
    if (event is BlocMyJourneysEventInitial) {
      listMyExperienceJson = await _profileRepository.getMyJourneys();
      emit(BlocMyJourneysStateAddJourney(
          appResult: AppResult(state: ResultState.success)));
    } else if (event is BlocMyJourneysEventClickButtonAddJourney) {
      Routes.navigateTo(AppPath.myJourneysAddMore, {});
    } else if (event is BlocMyJourneysEventClickButtonDone) {
      bool? validate = formKey.currentState?.validate();
      if (validate != null && validate && files != null) {
        MyExperienceJson myJourneyJson = MyExperienceJson(
            id: '0',
            name: journeyNameEditingController.text.trim(),
            destination: locationOfJourneyEditingController.text.trim(),
            createdAt: DateFormat.yMMMd().format(DateTime.now()),
            isFavorite: false,
            likes: 0,
            photos: files);
        listMyExperienceJson.add(myJourneyJson);

        emit(BlocMyJourneysStateAddJourney(
            appResult:
                AppResult(state: ResultState.success, result: myJourneyJson)));
        journeyNameEditingController.text = '';
        locationOfJourneyEditingController.text = '';
        Routes.backTo();
        files = null;
      } else {
        if (files == null) {
          isPhotoLoaded = false;
          files = null;
          emit(BlocMyJourneysStateUploadFileOrNot(files: files));
        }
      }
    } else if (event is BlocMyJourneysEventClickButtonUploadPhotos) {
      final photos = await ImagePicker().pickMultiImage();
      if (photos.isNotEmpty) {
        isPhotoLoaded = true;
        files = photos.map((e) => e.path).toList();
        emit(BlocMyJourneysStateUploadFileOrNot(files: files));
      }
    }
  }

  String? validateJourneyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your journey name';
    }
    return null;
  }

  String? validateLocationOfJourneyName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter location of journey';
    }
    return null;
  }
}
