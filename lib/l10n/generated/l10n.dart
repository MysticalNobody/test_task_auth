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
// ignore_for_file: avoid_redundant_argument_values

class Strings {
  Strings();
  
  static Strings current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      Strings.current = Strings();
      
      return Strings.current;
    });
  } 

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Авторизуйтесь, для доступа к приложению`
  String get auth_reason {
    return Intl.message(
      'Авторизуйтесь, для доступа к приложению',
      name: 'auth_reason',
      desc: '',
      args: [],
    );
  }

  /// `Для безопасного входа необходимо придумать код`
  String get need_create_pin_for_auth {
    return Intl.message(
      'Для безопасного входа необходимо придумать код',
      name: 'need_create_pin_for_auth',
      desc: '',
      args: [],
    );
  }

  /// `Введите пин-код`
  String get input_pin {
    return Intl.message(
      'Введите пин-код',
      name: 'input_pin',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, подождите`
  String get please_wait {
    return Intl.message(
      'Пожалуйста, подождите',
      name: 'please_wait',
      desc: '',
      args: [],
    );
  }

  /// `Идёт загрузка данных...`
  String get loading_in_progress {
    return Intl.message(
      'Идёт загрузка данных...',
      name: 'loading_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get close {
    return Intl.message(
      'Закрыть',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация по биометрии недоступна`
  String get biometrics_not_available {
    return Intl.message(
      'Авторизация по биометрии недоступна',
      name: 'biometrics_not_available',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось авторизоваться, используя биометрию`
  String get biometrics_auth_failed {
    return Intl.message(
      'Не удалось авторизоваться, используя биометрию',
      name: 'biometrics_auth_failed',
      desc: '',
      args: [],
    );
  }

  /// `Придумайте код доступа`
  String get create_pin {
    return Intl.message(
      'Придумайте код доступа',
      name: 'create_pin',
      desc: '',
      args: [],
    );
  }

  /// `Повторите код доступа`
  String get confirm_pin {
    return Intl.message(
      'Повторите код доступа',
      name: 'confirm_pin',
      desc: '',
      args: [],
    );
  }

  /// `Проверьте правильность ввода пин-кода`
  String get check_correct_pin {
    return Intl.message(
      'Проверьте правильность ввода пин-кода',
      name: 'check_correct_pin',
      desc: '',
      args: [],
    );
  }

  /// `Сбросить пин-код`
  String get reset_pin {
    return Intl.message(
      'Сбросить пин-код',
      name: 'reset_pin',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get auth {
    return Intl.message(
      'Авторизация',
      name: 'auth',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}