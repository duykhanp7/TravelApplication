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

  /// `Fellow 4U`
  String get app_name {
    return Intl.message(
      'Fellow 4U',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Traveler`
  String get traveler {
    return Intl.message(
      'Traveler',
      name: 'traveler',
      desc: '',
      args: [],
    );
  }

  /// `Tour Guide`
  String get tour_guide {
    return Intl.message(
      'Tour Guide',
      name: 'tour_guide',
      desc: '',
      args: [],
    );
  }

  /// `Password has more than 6 letters`
  String get password_has_more_than_6_letters {
    return Intl.message(
      'Password has more than 6 letters',
      name: 'password_has_more_than_6_letters',
      desc: '',
      args: [],
    );
  }

  /// `By singing up, you agree to our `
  String get by_singing_up_you_agree_to_our {
    return Intl.message(
      'By singing up, you agree to our ',
      name: 'by_singing_up_you_agree_to_our',
      desc: '',
      args: [],
    );
  }

  /// `Tern & Conditions`
  String get tern_conditions {
    return Intl.message(
      'Tern & Conditions',
      name: 'tern_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_an_account {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back,`
  String get welcom_back {
    return Intl.message(
      'Welcome back,',
      name: 'welcom_back',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgot_password {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `or sign in with`
  String get or_sign_in_with {
    return Intl.message(
      'or sign in with',
      name: 'or_sign_in_with',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
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
