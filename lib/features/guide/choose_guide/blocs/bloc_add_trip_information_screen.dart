import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/model/destination_json.dart';
import 'package:travel_booking_tour/features/guide/choose_guide/repository/add_trip_information_repository.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../../router/routes.dart';
import 'bloc_add_trip_information_event.dart';
import 'bloc_add_trip_information_state.dart';

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

  final AddTripInformationRepository _addTripInformationRepository =
      AddTripInformationRepository();

  void mapStateToEvent(BlocTripInformationEvent event,
      Emitter<BlocTripInformationState> emit) async {
    if (event is BlocTripInformationEventInitial) {
      textEditingControllerDate.text = '';
      textEditingControllerTimeFrom.text = '';
      textEditingControllerTimeTo.text = '';
      textEditingControllerCity.text = '';
      textEditingControllerNumberOfTravelers.text = '1';
      numberOfTravelers = textEditingControllerNumberOfTravelers.text;
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
      emit(BlocTripInformationStateSearchDestinationLoading());
      List<DestinationJson>? items =
          await _addTripInformationRepository.getDestination(event.name);
      if (items != null) {
        emit(BlocTripInformationStateSearchDestinationLoadingSuccess(
            data: items));
      } else {
        emit(BlocTripInformationStateSearchDestinationLoadingFail());
      }
    } else if (event is BlocTripInformationEventBack) {
      emit(BlocTripInformationStateClose());
    }
  }
}
