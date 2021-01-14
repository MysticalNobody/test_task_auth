import 'package:get_storage/get_storage.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepository {
  final pin = ReadWriteValue<String>('pin', null);
  // ignore: close_sinks
  ReplaySubject<bool> isLoggedIn = ReplaySubject<bool>();
}
