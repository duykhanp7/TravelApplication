import 'package:equatable/equatable.dart';

abstract class BlocPaymentState extends Equatable {}

class BlocPaymentStateInitial extends BlocPaymentState {
  @override
  List<Object?> get props => [];
}

class BlocPaymentStateNextStep extends BlocPaymentState {
  BlocPaymentStateNextStep({required this.step});
  final int step;
  @override
  List<Object?> get props => [step];
}
