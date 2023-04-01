import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/base/result.dart';
import 'package:travel_booking_tour/common/enums/enums.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/bloc/bloc_terms_and_conditions_event.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/bloc/bloc_terms_and_conditions_state.dart';
import 'package:travel_booking_tour/features/terms_and_conditions/repository/terms_and_conditions_repository.dart';

class BlocTermsAndConditionsScreen
    extends Bloc<BlocTermsAndConditionsEvent, BlocTermsAndConditionsState> {
  final TermsAndConditionsRepository _termsAndConditionsRepository =
      TermsAndConditionsRepository();

  BlocTermsAndConditionsScreen() : super(BlocTermsAndConditionsStateInitial()) {
    on<BlocTermsAndConditionsEvent>(
        (event, emit) => mapStateToEvent(event, emit));
  }

  void mapStateToEvent(BlocTermsAndConditionsEvent event,
      Emitter<BlocTermsAndConditionsState> emit) async {
    if (event is BlocTermsAndConditionsEventInitial) {
      final termsAndConditions =
          await _termsAndConditionsRepository.getTermsAndConditions();
      if (termsAndConditions.isNotEmpty) {
        await Future.delayed(
          const Duration(seconds: 2),
          () {
            emit(BlocTermsAndConditionsStateLoading(
                appResult: AppResult(
                    state: ResultState.success, result: termsAndConditions)));
          },
        );
      } else {
        emit(BlocTermsAndConditionsStateLoading(
            appResult: AppResult(state: ResultState.fail)));
      }
    }
  }
}
