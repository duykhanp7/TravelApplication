import 'package:equatable/equatable.dart';
import 'package:travel_booking_tour/features/main/model/type_filter_json.dart';

import '../../../data/model/language_json.dart';

abstract class BlocSearchSystemEvent extends Equatable {}

class BlocSearchSystemEventInitial extends BlocSearchSystemEvent {
  @override
  List<Object?> get props => [];
}

class BlocSearchSystemEventChooseTypeFilter extends BlocSearchSystemEvent {
  BlocSearchSystemEventChooseTypeFilter({required this.typeFilter});

  final TypeFilterJson typeFilter;
  @override
  List<Object?> get props => [typeFilter];
}

class BlocSearchSystemEventChooseLanguageFilter extends BlocSearchSystemEvent {
  BlocSearchSystemEventChooseLanguageFilter({required this.languageJson});
  final LanguageJson languageJson;
  @override
  List<Object?> get props => [languageJson];
}

class BlocSearchSystemEventApplyFilter extends BlocSearchSystemEvent {
  BlocSearchSystemEventApplyFilter();

  @override
  List<Object?> get props => [];
}

class BlocSearchSystemEventSearching extends BlocSearchSystemEvent {
  @override
  List<Object?> get props => [];
}

class BlocSearchSystemEventClearSearch extends BlocSearchSystemEvent {
  @override
  List<Object?> get props => [];
}
