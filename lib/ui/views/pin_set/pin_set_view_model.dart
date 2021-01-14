import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';
import 'package:test_task_auth/data/services/auth_service.dart';
import 'package:test_task_auth/ui/widgets/app_pin_button.dart';

import '../../../l10n/generated/l10n.dart';

class PinSetViewModel extends BaseViewModel {
  PinSetViewModel(BuildContext context) {
    navigator = Navigator.of(context);
    authService = context.read<AuthService>();
  }
  NavigatorState navigator;
  AuthService authService;

  final localAuth = LocalAuthentication();
  final pinLength = 4;

  BehaviorSubject<AppPinButtonState> showBiometrics =
      BehaviorSubject<AppPinButtonState>.seeded(AppPinButtonState.loading);
  BehaviorSubject<bool> pinError = BehaviorSubject<bool>.seeded(false);
  String pin = '';
  String pinConfirm = '';

  Future<void> onReady() async {
    showBiometrics.add(await checkBiometricsAvailability());
  }

  Future<void> setPin() async {
    authService.pin = pin;
    authService.login(pin);
  }

  void onPinTap(int number) {
    pinError.add(false);
    if (pin.length < pinLength) {
      pin += number.toString();
    } else if (pin.length == pinLength && pinConfirm.length < pinLength) {
      pinConfirm += number.toString();
    }
    if (pin == pinConfirm) {
      setPin();
      return;
    }
    if (pin.length == pinLength && pinConfirm.length == pinLength && pin != pinConfirm) {
      showError();
      return;
    }
    notifyListeners();
  }

  void clearPin() {
    pin = '';
    pinConfirm = '';
    pinError.add(false);
    notifyListeners();
  }

  void showError() {
    pinError.add(true);
    pinConfirm = '';
    notifyListeners();
    Future<void>.delayed(const Duration(seconds: 1)).then((_) {
      pinError.add(false);
      notifyListeners();
    });
  }

  Future<void> onBiometricsTap(AppPinButtonState state) async {
    if (state == AppPinButtonState.active) {
      authWithBiometrics();
    } else if (state == AppPinButtonState.loading) {
      showPlatformDialog(
        context: navigator.context,
        builder: (_) => PlatformAlertDialog(
          title: Text(Strings.current.please_wait),
          content: Text(Strings.current.loading_in_progress),
          actions: [
            PlatformDialogAction(
              onPressed: () => navigator.pop(),
              child: PlatformText(Strings.current.close),
            ),
          ],
        ),
      );
    } else {
      showPlatformDialog(
        context: navigator.context,
        builder: (_) => PlatformAlertDialog(
          title: Text(Strings.current.error),
          content: Text(Strings.current.biometrics_not_available),
          actions: [
            PlatformDialogAction(
              onPressed: () => navigator.pop(),
              child: PlatformText(Strings.current.close),
            ),
          ],
        ),
      );
    }
  }

  Future<bool> authWithBiometrics() async {
    return localAuth.authenticateWithBiometrics(
        localizedReason: Strings.current.auth_reason);
  }

  Future<AppPinButtonState> checkBiometricsAvailability() async {
    final res = await localAuth.canCheckBiometrics;
    if (res) {
      return AppPinButtonState.active;
    } else {
      return AppPinButtonState.error;
    }
  }

  @override
  void dispose() {
    showBiometrics.close();
    pinError.close();
    super.dispose();
  }
}
