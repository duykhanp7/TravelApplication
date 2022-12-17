// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class SLocalization {
  SLocalization();

  static SLocalization? _current;

  static SLocalization get current {
    assert(_current != null,
        'No instance of SLocalization was loaded. Try to initialize the SLocalization delegate before accessing SLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SLocalization();
      SLocalization._current = instance;

      return instance;
    });
  }

  static SLocalization of(BuildContext context) {
    final instance = SLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of SLocalization present in the widget tree. Did you add SLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static SLocalization? maybeOf(BuildContext context) {
    return Localizations.of<SLocalization>(context, SLocalization);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SLocalization> load(Locale locale) => SLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
