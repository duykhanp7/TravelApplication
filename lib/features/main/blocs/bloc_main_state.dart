import 'package:equatable/equatable.dart';

abstract class BlocMainState extends Equatable {}

class BlocMainStateInitial extends BlocMainState {
  @override
  List<Object?> get props => [];
}

class BlocMainStateChangeTabIndex extends BlocMainState {
  final int index;
  BlocMainStateChangeTabIndex({required this.index});
  @override
  List<Object?> get props => [index];
}
