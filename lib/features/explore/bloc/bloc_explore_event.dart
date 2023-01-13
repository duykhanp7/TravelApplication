import 'package:equatable/equatable.dart';

abstract class BlocExploreEvent extends Equatable {}

class BlocExploreEventInitial extends BlocExploreEvent {
  final List<dynamic>? objects;

  BlocExploreEventInitial({required this.objects});

  @override
  List<Object?> get props => [];
}

class BlocExploreEventReloadData extends BlocExploreEvent {
  @override
  List<Object?> get props => [];
}

class BlocExploreEventOnTopJourneyClick extends BlocExploreEvent {
  @override
  List<Object?> get props => [];
}
