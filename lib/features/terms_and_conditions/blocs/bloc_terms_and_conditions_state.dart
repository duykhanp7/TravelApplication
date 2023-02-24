import 'package:equatable/equatable.dart';

abstract class BlocTermsAndConditionsState extends Equatable {}

class BlocTermsAndConditionsStateInitial extends BlocTermsAndConditionsState {
  @override
  List<Object?> get props => [];
}

class BlocTermsAndConditionsStateLoadSuccess
    extends BlocTermsAndConditionsState {
  BlocTermsAndConditionsStateLoadSuccess({required this.termsAndConditions});
  final List<String> termsAndConditions;
  @override
  List<Object?> get props => [];
}

class BlocTermsAndConditionsStateLoadFail extends BlocTermsAndConditionsState {
  @override
  List<Object?> get props => [];
}
