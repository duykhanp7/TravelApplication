import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    debugPrint('On Create');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('On Change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('On Error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('On Close');
    super.onClose(bloc);
  }
}
