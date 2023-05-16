import 'package:equatable/equatable.dart';

import '../../../../common/enum/enums.dart';

abstract class BlocSignUpTourGuideInformationEvent extends Equatable {}

class BlocSignUpTourGuideInformationEventChangeStep
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeStep({required this.step});
  final int step;
  @override
  List<Object?> get props => [step];
}

class BlocSignUpTourGuideInformationEventChangeIndexDateClick
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeIndexDateClick(
      {required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class BlocSignUpTourGuideInformationEventChangeAddress
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeAddress({required this.address});
  final String address;
  @override
  List<Object?> get props => [address];
}

class BlocSignUpTourGuideInformationEventChangeCity
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeCity({required this.city});
  final String city;
  @override
  List<Object?> get props => [city];
}

class BlocSignUpTourGuideInformationEventChangeCountry
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeCountry({required this.country});
  final String country;
  @override
  List<Object?> get props => [country];
}

class BlocSignUpTourGuideInformationEventChangePhoneNumber
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangePhoneNumber(
      {required this.phoneNumber});
  final String phoneNumber;
  @override
  List<Object?> get props => [phoneNumber];
}

class BlocSignUpTourGuideInformationEventChangeLanguages
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeLanguages({required this.languages});
  final String languages;
  @override
  List<Object?> get props => [languages];
}

class BlocSignUpTourGuideInformationEventChangeIntroduction
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeIntroduction(
      {required this.introduction});
  final String introduction;
  @override
  List<Object?> get props => [introduction];
}

class BlocSignUpTourGuideInformationEventChangeTimeFrom
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeTimeFrom({required this.timeFrom});
  final String timeFrom;
  @override
  List<Object?> get props => [timeFrom];
}

class BlocSignUpTourGuideInformationEventChangeTimeTo
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeTimeTo({required this.timeTo});
  final String timeTo;
  @override
  List<Object?> get props => [timeTo];
}

class BlocSignUpTourGuideInformationEventChangeFee
    extends BlocSignUpTourGuideInformationEvent {
  BlocSignUpTourGuideInformationEventChangeFee(
      {required this.fee,
      required this.quantityTraveler,
      required this.current});
  final String fee;
  final QuantityTraveler quantityTraveler;
  final int current;
  @override
  List<Object?> get props => [fee, quantityTraveler, current];
}

class BlocSignUpTourGuideInformationEventPickProfileImage
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventRemoveProfileImage
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventPickGuideLicenseImage
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventRemoveGuideLicenseImage
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventPickIdentityCardImage
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventRemoveIdentityCardImage
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventPickVideoIntroduction
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventRemoveVideoIntroduction
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventClose
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}

class BlocSignUpTourGuideInformationEventFinishAddInfo
    extends BlocSignUpTourGuideInformationEvent {
  @override
  List<Object?> get props => [];
}
