import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_booking_tour/features/signup/sign_up_screen.dart';
import 'package:travel_booking_tour/res/colors.dart';

import 'l10n/generated/l10n.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fellow 4U",
      theme: ThemeData(backgroundColor: AppColors.white, fontFamily: 'Roboto'),
      home: const SignUpScreen(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const <LocalizationsDelegate<Object>>[
        SLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('vi'), Locale('en')],
      locale: const Locale('vi'),
    );
  }
}
