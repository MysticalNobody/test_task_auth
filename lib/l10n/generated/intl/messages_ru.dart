// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "auth" : MessageLookupByLibrary.simpleMessage("Авторизация"),
    "auth_reason" : MessageLookupByLibrary.simpleMessage("Авторизуйтесь, для доступа к приложению"),
    "biometrics_auth_failed" : MessageLookupByLibrary.simpleMessage("Не удалось авторизоваться, используя биометрию"),
    "biometrics_not_available" : MessageLookupByLibrary.simpleMessage("Авторизация по биометрии недоступна"),
    "check_correct_pin" : MessageLookupByLibrary.simpleMessage("Проверьте правильность ввода пин-кода"),
    "close" : MessageLookupByLibrary.simpleMessage("Закрыть"),
    "confirm_pin" : MessageLookupByLibrary.simpleMessage("Повторите код доступа"),
    "create_pin" : MessageLookupByLibrary.simpleMessage("Придумайте код доступа"),
    "error" : MessageLookupByLibrary.simpleMessage("Ошибка"),
    "input_pin" : MessageLookupByLibrary.simpleMessage("Введите пин-код"),
    "loading_in_progress" : MessageLookupByLibrary.simpleMessage("Идёт загрузка данных..."),
    "need_create_pin_for_auth" : MessageLookupByLibrary.simpleMessage("Для безопасного входа необходимо придумать код"),
    "please_wait" : MessageLookupByLibrary.simpleMessage("Пожалуйста, подождите"),
    "reset_pin" : MessageLookupByLibrary.simpleMessage("Сбросить пин-код")
  };
}
