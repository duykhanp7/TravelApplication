import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_booking_tour/features/onboarding/onboarding_screen.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_event.dart';
import 'package:travel_booking_tour/features/splash/bloc/bloc_splash_screen.dart';
import 'package:travel_booking_tour/features/splash/splash_screen.dart';
import 'package:travel_booking_tour/res/colors.dart';
import 'package:travel_booking_tour/router/path.dart';
import 'package:travel_booking_tour/router/routes.dart';

import 'l10n/generated/l10n.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BlocSplashScreen>(
            create: (context) => BlocSplashScreen()..add(SplashEventInitial()),
          ),
        ],
        child: MaterialApp(
          title: "Fellow 4U",
          theme:
              ThemeData(backgroundColor: AppColors.white, fontFamily: 'Roboto'),
          initialRoute: AppPath.splashScreen,
          home: const SplashScreen(),
          routes: {
            AppPath.splashScreen: (context) => const SplashScreen(),
            AppPath.onBoardingSCreen: (context) => const OnboardingScreen(),
          },
          navigatorKey: Routes.navigator,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const <LocalizationsDelegate<Object>>[
            SLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[Locale('vi'), Locale('en')],
          locale: const Locale('vi'),
        ));
  }
}
