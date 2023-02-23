import 'package:equatable/equatable.dart';

abstract class BlocmainEvent extends Equatable {}

class BlocmainEventInitial extends BlocmainEvent {
  @override
  List<Object?> get props => [];
}

class BlocmainEventChangeTabIndex extends BlocmainEvent {
  final int index;
  BlocmainEventChangeTabIndex({required this.index});
  @override
  List<Object?> get props => [index];
}
