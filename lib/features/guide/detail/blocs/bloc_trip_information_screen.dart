import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_trip_information_event.dart';
import 'package:travel_booking_tour/features/guide/detail/blocs/bloc_trip_information_state.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../../router/routes.dart';

class BlocTripInformationScreen
    extends Bloc<BlocTripInformationEvent, BlocTripInformationState> {
  BlocTripInformationScreen() : super(BlocTripInformationStateInitial()) {
    on<BlocTripInformationEvent>((event, emit) => mapStateToEvent(event, emit));
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

  void mapStateToEvent(BlocTripInformationEvent event,
      Emitter<BlocTripInformationState> emit) async {
    if (event is BlocTripInformationEventInitial) {
      textEditingControllerDate.text = '';
      textEditingControllerTimeFrom.text = '';
      textEditingControllerTimeTo.text = '';
      textEditingControllerCity.text = '';
      textEditingControllerNumberOfTravelers.text = '1';
      numberOfTravelers = textEditingControllerNumberOfTravelers.text;
    }
    if (event is BlocTripInformationEventChangeDate) {
      date = event.date;
    }
    if (event is BlocTripInformationEventChangeTimeFrom) {
      timeFrom = event.timeFrom;
    }
    if (event is BlocTripInformationEventChangeTimeTo) {
      timeTo = event.timeTo;
    }
    if (event is BlocTripInformationEventChangeCity) {
      city = event.city;
    }
    if (event is BlocTripInformationEventChangeNumberOfTravelers) {
      numberOfTravelers = event.numberOfTravelers;
    }
    if (event is BlocTripInformationEventAddNumberOfTravelers) {
      if (numberOfTravelers != null) {
        textEditingControllerNumberOfTravelers.text =
            (int.parse(numberOfTravelers!) + 1).toString();
        numberOfTravelers = textEditingControllerNumberOfTravelers.text;
      }
    }
    if (event is BlocTripInformationEventSubtractNumberOfTravelers) {
      if (numberOfTravelers != null) {
        if (int.parse(numberOfTravelers!) > 0) {
          textEditingControllerNumberOfTravelers.text =
              (int.parse(numberOfTravelers!) - 1).toString();
          numberOfTravelers = textEditingControllerNumberOfTravelers.text;
        }
      }
    }
    if (event is BlocTripInformationEventCheckAttractions) {
      emit(BlocTripInformationStateCheck(current: DateTime.now().microsecond));
    }
    if (event is BlocTripInformationEventUnCheckAttractions) {
      emit(BlocTripInformationStateCheck(current: DateTime.now().microsecond));
    }
    if (event is BlocTripInformationEventChangeAddNewAttractions) {
      Routes.navigateTo(AppPath.addNewPlaces, {});
    }
    if (event is BlocTripInformationEventDone) {
      debugPrint(
          'All information : $date $timeFrom $timeTo $city $numberOfTravelers');
    }
  }
}
