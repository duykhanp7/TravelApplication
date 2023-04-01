import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_search_system_event.dart';
import 'package:travel_booking_tour/features/main/bloc/bloc_search_system_state.dart';
import 'package:travel_booking_tour/features/main/repository/search_system_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../../common/enum/enums.dart';
import '../../../data/model/language_json.dart';
import '../model/type_filter_json.dart';

class BlocSearchSystemScreen
    extends Bloc<BlocSearchSystemEvent, BlocSearchSystemState> {
  List<TypeFilterJson> typeFilters = [];
  List<LanguageJson> languages = [];
  final SearchSystemRepository _searchSystemRepository =
      SearchSystemRepository();

  TypeFilterJson? currentTypeFilter;
  LanguageJson? currentLanguage;

  BlocSearchSystemScreen() : super(BlocSearchSystemStateIntitial()) {
    on<BlocSearchSystemEvent>((mapStateToEvent), transformer: restartable());
  }

  Future<void> mapStateToEvent(
      BlocSearchSystemEvent event, Emitter<BlocSearchSystemState> emit) async {
    if (event is BlocSearchSystemEventInitial) {
      typeFilters = await _searchSystemRepository.getListTypeFilter();
      languages = await _searchSystemRepository.getLanguagesFilter();
      currentTypeFilter = typeFilters[0];
    } else if (event is BlocSearchSystemEventChooseTypeFilter) {
      currentTypeFilter = event.typeFilter;
      emit(BlocSearchSystemStateChooseTypeFilter(typeFilter: event.typeFilter));
    } else if (event is BlocSearchSystemEventChooseLanguageFilter) {
      currentLanguage = event.languageJson;
      emit(BlocSearchSystemStateChooseLanguageFilter(
          languageJson: event.languageJson));
    } else if (event is BlocSearchSystemEventApplyFilter) {
    } else if (event is BlocSearchSystemEventClearSearch) {
      emit(BlocSearchSystemStateClearSearching());
    } else if (event is BlocSearchSystemEventSearching) {
      emit(BlocSearchSystemStateSearching(
          appResult: AppResult(state: ResultState.loading)));
      final itemTourGuides = await _searchSystemRepository.getTourGuides();
      final itemTours = await _searchSystemRepository.getListTopJourney();
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          Map<Searching, List<dynamic>> mapData = {
            Searching.itemTourGuides: itemTourGuides,
            Searching.itemsTours: itemTours
          };
          emit(BlocSearchSystemStateSearching(
              appResult:
                  AppResult(state: ResultState.success, result: mapData)));
        },
      );
    }
  }
}
