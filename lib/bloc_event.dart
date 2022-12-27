import 'package:equatable/equatable.dart';

abstract class BlocTestEvent extends Equatable {
  const BlocTestEvent();
}

class BlocTestInitialEvent extends BlocTestEvent {
  @override
  List<Object?> get props => [];
}

class BlocTestLoadDataEvent extends BlocTestEvent {
  @override
  List<Object?> get props => [];
}

class BlocTestStopLoadDataEvent extends BlocTestEvent {
  @override
  List<Object?> get props => [];
}
