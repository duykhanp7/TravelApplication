import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/model/destination_json.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/repository/edit_trip_information_repository.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../../common/enum/enums.dart';
import '../../../../router/routes.dart';
import 'bloc_edit_trip_information_event.dart';
import 'bloc_edit_trip_information_state.dart';

class BlocTripInformationScreen
    extends Bloc<BlocTripInformationEvent, BlocTripInformationState> {
  BlocTripInformationScreen() : super(BlocTripInformationStateInitial()) {
    on<BlocTripInformationEvent>(mapStateToEvent, transformer: restartable());
  }

  String? date;
  String? timeFrom;
  String? timeTo;
  String? city;
  String? numberOfTravelers;

  TextEditingController textEditingControllerDate =
      TextEditingController(text: '');
  TextEditingController textEditingControllerTimeFrom =
      TextEditingController(text: '');
  TextEditingController textEditingControllerTimeTo =
      TextEditingController(text: '');
  TextEditingController textEditingControllerCity =
      TextEditingController(text: '');
  TextEditingController textEditingControllerNumberOfTravelers =
      TextEditingController(text: '');

  final EditTripInformationRepository _editTripInformationRepository =
      EditTripInformationRepository();

  void mapStateToEvent(BlocTripInformationEvent event,
      Emitter<BlocTripInformationState> emit) async {
    if (event is BlocTripInformationEventInitial) {
      textEditingControllerDate.text = '';
      textEditingControllerTimeFrom.text = '';
      textEditingControllerTimeTo.text = '';
      textEditingControllerCity.text = '';
      textEditingControllerNumberOfTravelers.text = '1';
      numberOfTravelers = textEditingControllerNumberOfTravelers.text;
      final data = _editTripInformationRepository.destinations;
      emit(BlocTripInformationStateLoadDestination(
          appResult: AppResult(state: ResultState.success, result: data)));
    } else if (event is BlocTripInformationEventChangeDate) {
      date = event.date;
    } else if (event is BlocTripInformationEventChangeTimeFrom) {
      timeFrom = event.timeFrom;
    } else if (event is BlocTripInformationEventChangeTimeTo) {
      timeTo = event.timeTo;
    } else if (event is BlocTripInformationEventChangeCity) {
      city = event.city;
    } else if (event is BlocTripInformationEventChangeNumberOfTravelers) {
      numberOfTravelers = event.numberOfTravelers;
    } else if (event is BlocTripInformationEventAddNumberOfTravelers) {
      if (numberOfTravelers != null) {
        textEditingControllerNumberOfTravelers.text =
            (int.parse(numberOfTravelers!) + 1).toString();
        numberOfTravelers = textEditingControllerNumberOfTravelers.text;
      }
    } else if (event is BlocTripInformationEventSubtractNumberOfTravelers) {
      if (numberOfTravelers != null) {
        if (int.parse(numberOfTravelers!) > 0) {
          textEditingControllerNumberOfTravelers.text =
              (int.parse(numberOfTravelers!) - 1).toString();
          numberOfTravelers = textEditingControllerNumberOfTravelers.text;
        }
      }
    } else if (event is BlocTripInformationEventCheckAttractions) {
      emit(BlocTripInformationStateCheck(current: DateTime.now().microsecond));
    } else if (event is BlocTripInformationEventUnCheckAttractions) {
      emit(BlocTripInformationStateCheck(current: DateTime.now().microsecond));
    } else if (event is BlocTripInformationEventChangeAddNewAttractions) {
      Routes.navigateTo(AppPath.addNewPlaces, {});
    } else if (event is BlocTripInformationEventDone) {
    } else if (event is BlocTripInformationEventSearchDestination) {
      emit(BlocTripInformationStateSearchDestination(
          appResult: AppResult(state: ResultState.loading)));
      List<DestinationJson>? items =
          await _editTripInformationRepository.getDestination(event.name);
      if (items != null) {
        emit(BlocTripInformationStateSearchDestination(
            appResult: AppResult(state: ResultState.success, result: items)));
      } else {
        emit(BlocTripInformationStateSearchDestination(
            appResult: AppResult(state: ResultState.fail)));
      }
    } else if (event is BlocTripInformationEventBack) {
      emit(BlocTripInformationStateClose());
    }
  }
}
