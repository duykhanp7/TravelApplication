import 'package:equatable/equatable.dart';

abstract class BlocMainEvent extends Equatable {}

class BlocMainEventInitial extends BlocMainEvent {
  @override
  List<Object?> get props => [];
}

class BlocMainEventChangeTabIndex extends BlocMainEvent {
  final int index;
  BlocMainEventChangeTabIndex({required this.index});
  @override
  List<Object?> get props => [index];
}

class BlocMainEventSearchSystemClick extends BlocMainEvent {
  @override
  List<Object?> get props => [];
}
