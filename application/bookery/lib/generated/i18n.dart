import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef LocaleChangeCallback = void Function(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    I18n._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "Sign up to Bookery now"
  String get signUpNow => "Sign up to Bookery now";
  /// "New to Bookery?"
  String get newUser => "New to Bookery?";
  /// "I already have an account."
  String get alreadyHaveAccount => "I already have an account.";
  /// "Google."
  String get signUpWithGoogle => "Google.";
  /// "email and password."
  String get signUpWithEmailAndPassword => "email and password.";
  /// "with"
  String get withWord => "with";
  /// "or"
  String get orWord => "or";
  /// "What's your name?"
  String get nameInputHint => "What's your name?";
  /// "Please insert your name!"
  String get noName => "Please insert your name!";
  /// "Your name has to be at least four letters long. :("
  String get nameTooShort => "Your name has to be at least four letters long. :(";
  /// "Your name can't contain special characters. :("
  String get nameNoSpecialCharacters => "Your name can't contain special characters. :(";
  /// "Your name can't containt spaces! :/"
  String get nameNoSpaces => "Your name can't containt spaces! :/";
}

class _I18n_en_GB extends I18n {
  const _I18n_en_GB();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_de_DE extends I18n {
  const _I18n_de_DE();

  /// "Erstelle jetzt Dein Account bei Bookery"
  @override
  String get signUpNow => "Erstelle jetzt Dein Account bei Bookery";
  /// "Neu hier?"
  @override
  String get newUser => "Neu hier?";
  /// "Ich habe bereits ein Account."
  @override
  String get alreadyHaveAccount => "Ich habe bereits ein Account.";
  /// "Google."
  @override
  String get signUpWithGoogle => "Google.";
  /// "E-Mail und Passwort."
  @override
  String get signUpWithEmailAndPassword => "E-Mail und Passwort.";
  /// "mit"
  @override
  String get withWord => "mit";
  /// "oder"
  @override
  String get orWord => "oder";
  /// "Wie willst du genannt werden?"
  @override
  String get nameInputHint => "Wie willst du genannt werden?";
  /// "Du hast dir noch keinen Namen gegeben!"
  @override
  String get noName => "Du hast dir noch keinen Namen gegeben!";
  /// "Dein Name muss mindestens vier Buchstaben lang sein. :("
  @override
  String get nameTooShort => "Dein Name muss mindestens vier Buchstaben lang sein. :(";
  /// "Dein Name darf keine Sonderzeichen enthalten. :/"
  @override
  String get nameNoSpecialCharacters => "Dein Name darf keine Sonderzeichen enthalten. :/";
  /// "Dein Name darf keine Leerzeichen enthalten! :("
  @override
  String get nameNoSpaces => "Dein Name darf keine Leerzeichen enthalten! :(";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", "GB"),
      Locale("de", "DE")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    I18n._locale ??= locale;
    I18n._shouldReload = false;
    final String lang = I18n._locale != null ? I18n._locale.toString() : "";
    final String languageCode = I18n._locale != null ? I18n._locale.languageCode : "";
    if ("en_GB" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_GB());
    }
    else if ("de_DE" == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_de_DE());
    }
    else if ("en" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_en_GB());
    }
    else if ("de" == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _I18n_de_DE());
    }

    return SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}