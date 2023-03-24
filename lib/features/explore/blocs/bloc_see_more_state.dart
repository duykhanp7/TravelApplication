import 'package:equatable/equatable.dart';

abstract class BlocSeeMoreState extends Equatable {}

class BlocSeeMoreStateInitial extends BlocSeeMoreState {
  @override
  List<Object?> get props => [];
}

class BlocSeeMoreStateLoading extends BlocSeeMoreState {
  @override
  List<Object?> get props => [];
}

class BlocSeeMoreStateLoadingMore extends BlocSeeMoreState {
  @override
  List<Object?> get props => [];
}

class BlocSeeMoreStateLoadingMoreSuccess<T> extends BlocSeeMoreState {
  BlocSeeMoreStateLoadingMoreSuccess({required this.data});
  final List<T>? data;
  @override
  List<Object?> get props => [data];
}

class BlocSeeMoreStateLoadingMoreFail extends BlocSeeMoreState {
  @override
  List<Object?> get props => [];
}

class BlocSeeMoreStateLoadingDone extends BlocSeeMoreState {
  @override
  List<Object?> get props => [];
}
