import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_tour_guide_information_event.dart';
import 'package:travel_booking_tour/features/auth/signup/blocs/bloc_sign_up_tour_guide_information_state.dart';

class BlocSignUpTourGuideInformationScreen extends Bloc<
    BlocSignUpTourGuideInformationEvent, BlocSignUpTourGuideInformationState> {
  int currentIndexDate = 0;
  int currentIndexStep = 0;
  String address = '';
  String city = '';
  String country = '';
  String phoneNumber = '';
  String languages = '';
  String introduction = '';

  TextEditingController textEditingControllerAddress = TextEditingController();
  TextEditingController textEditingControllerCity = TextEditingController();
  TextEditingController textEditingControllerCountry = TextEditingController();
  TextEditingController textEditingControllerPhoneNumber =
      TextEditingController();
  TextEditingController textEditingControllerLanguages =
      TextEditingController();
  TextEditingController textEditingControllerIntroduction =
      TextEditingController();
  TextEditingController textEditingControllerTimeFrom = TextEditingController();
  TextEditingController textEditingControllerTimeTo = TextEditingController();
  final GlobalKey<FormState> signUpTourGuideInformationGlobalKey =
      GlobalKey<FormState>();

  BlocSignUpTourGuideInformationScreen()
      : super(BlocSignUpTourGuideInformationStateInitial()) {
    on<BlocSignUpTourGuideInformationEvent>(
        (event, emit) async => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(BlocSignUpTourGuideInformationEvent event,
      Emitter<BlocSignUpTourGuideInformationState> emit) async {
    if (event is BlocSignUpTourGuideInformationEventChangeStep) {
      currentIndexStep = event.step;
      if (signUpTourGuideInformationGlobalKey.currentState != null) {
        debugPrint(
            'All information : $address $city $country $phoneNumber $languages $introduction');
        if (signUpTourGuideInformationGlobalKey.currentState!.validate()) {
          emit(BlocSignUpTourGuideInformationStateChangeStep(
              step: currentIndexStep));
        }
      }
    } else if (event
        is BlocSignUpTourGuideInformationEventChangeIndexDateClick) {
      currentIndexDate = event.index;
      emit(BlocSignUpTourGuideInformationStateChangeIndexDate(
          index: event.index));
    } else if (event is BlocSignUpTourGuideInformationEventChangeAddress) {
      address = event.address;
    } else if (event is BlocSignUpTourGuideInformationEventChangeCity) {
      city = event.city;
    } else if (event is BlocSignUpTourGuideInformationEventChangeCountry) {
      country = event.country;
    } else if (event is BlocSignUpTourGuideInformationEventChangePhoneNumber) {
      phoneNumber = event.phoneNumber;
    } else if (event is BlocSignUpTourGuideInformationEventChangeLanguages) {
      languages = event.languages;
    } else if (event is BlocSignUpTourGuideInformationEventChangeIntroduction) {
      introduction = event.introduction;
    }
  }

  void clearDatas() {
    address = '';
    city = '';
    country = '';
    phoneNumber = '';
    languages = '';
    introduction = '';
    textEditingControllerAddress.text = '';
    textEditingControllerCity.text = '';
    textEditingControllerCountry.text = '';
    textEditingControllerPhoneNumber.text = '';
    textEditingControllerLanguages.text = '';
    textEditingControllerIntroduction.text = '';
    textEditingControllerTimeTo.text = '';
    textEditingControllerTimeFrom.text = '';
  }
}
