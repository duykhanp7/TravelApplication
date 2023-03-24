import 'package:bloc/bloc.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_event.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_state.dart';
import 'package:travel_booking_tour/router/path.dart';

import '../../../router/routes.dart';

class BlocSplashScreen extends Bloc<BlocSplashEvent, BlocSplashState> {
  BlocSplashScreen() : super(BlocSplashStateInitial()) {
    on<BlocSplashEventInitial>((event, emit) => {
          Future.delayed(
            const Duration(seconds: 3),
            () => Routes.navigatoReplacement(AppPath.onBoardingSCreen, {}),
          )
        });
  }
}
