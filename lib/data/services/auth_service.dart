import 'package:test_task_auth/data/repository/auth_repository.dart';

class AuthService {
  AuthService(this._authRepository);

  final AuthRepository _authRepository;

  set pin(String pin) => _authRepository.pin.val = pin;
  String get pin => _authRepository.pin.val;

  bool login(String pin, {bool viaBiometrics = false}) {
    if (pin == this.pin || viaBiometrics) {
      _authRepository.isLoggedIn.add(true);
      return true;
    } else {
      return false;
    }
  }

  void clearLoggedIn() {
    _authRepository.isLoggedIn.add(false);
  }

  void logout() {
    _authRepository.isLoggedIn.add(false);
    _authRepository.pin.val = null;
  }
}
