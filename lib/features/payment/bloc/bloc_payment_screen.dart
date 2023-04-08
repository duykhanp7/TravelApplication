import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:travel_booking_tour/features/payment/bloc/bloc_payment_event.dart';
import 'package:travel_booking_tour/features/payment/bloc/bloc_payment_state.dart';

class BlocPaymentScreen extends Bloc<BlocPaymentEvent, BlocPaymentState> {
  BlocPaymentScreen() : super(BlocPaymentStateInitial()) {
    on<BlocPaymentEvent>(mapStateToEvent, transformer: restartable());
  }

  int currentStep = 0;

  void mapStateToEvent(
      BlocPaymentEvent event, Emitter<BlocPaymentState> emit) async {
    if (event is BlocPaymentEventInitial) {
      currentStep = 0;
    } else if (event is BlocPaymentEventNextStep) {
      currentStep = event.step;
      emit(BlocPaymentStateNextStep(step: currentStep));
    }
  }
}
