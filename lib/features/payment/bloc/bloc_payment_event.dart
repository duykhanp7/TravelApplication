import 'package:equatable/equatable.dart';

abstract class BlocPaymentEvent extends Equatable {}

class BlocPaymentEventInitial extends BlocPaymentEvent {
  @override
  List<Object?> get props => [];
}

class BlocPaymentEventNextStep extends BlocPaymentEvent {
  BlocPaymentEventNextStep({required this.step});
  final int step;
  @override
  List<Object?> get props => [step];
}
