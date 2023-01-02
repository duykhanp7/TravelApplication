import 'package:equatable/equatable.dart';

abstract class BlocTestState extends Equatable {
  const BlocTestState();
}

class BlocTestStateInitial extends BlocTestState {
  @override
  List<Object?> get props => [];
}

class BlocTestStateLoadSuccess extends BlocTestState {
  @override
  List<Object?> get props => [];
}

class BlocTestStateLoadFail extends BlocTestState {
  @override
  List<Object?> get props => [];
}
