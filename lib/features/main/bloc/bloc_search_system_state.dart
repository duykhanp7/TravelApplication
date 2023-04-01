import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/data/models/language_json.dart';
import 'package:travel_booking_tour/features/main/model/type_filter_json.dart';

import '../../../base/result.dart';

abstract class BlocSearchSystemState extends Equatable {}

class BlocSearchSystemStateIntitial extends BlocSearchSystemState {
  BlocSearchSystemStateIntitial();
  @override
  List<Object?> get props => [];
}

class BlocSearchSystemStateChooseTypeFilter extends BlocSearchSystemState {
  BlocSearchSystemStateChooseTypeFilter({required this.typeFilter});
  final TypeFilterJson typeFilter;
  @override
  List<Object?> get props => [typeFilter];
}

class BlocSearchSystemStateChooseLanguageFilter extends BlocSearchSystemState {
  BlocSearchSystemStateChooseLanguageFilter({required this.languageJson});
  final LanguageJson languageJson;
  @override
  List<Object?> get props => [languageJson];
}

class BlocSearchSystemStateSearching extends BlocSearchSystemState {
  BlocSearchSystemStateSearching({required this.appResult});
  final AppResult appResult;
  @override
  List<Object?> get props => [appResult];
}

class BlocSearchSystemStateClearSearching extends BlocSearchSystemState {
  @override
  List<Object?> get props => [];
}
