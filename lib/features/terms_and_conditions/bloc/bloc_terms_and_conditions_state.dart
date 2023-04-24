import 'package:equatable/equatable.dart';

import '../../../data/model/result.dart';

abstract class BlocTermsAndConditionsState extends Equatable {}

class BlocTermsAndConditionsStateInitial extends BlocTermsAndConditionsState {
  @override
  List<Object?> get props => [];
}

class BlocTermsAndConditionsStateLoading extends BlocTermsAndConditionsState {
  BlocTermsAndConditionsStateLoading({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}
