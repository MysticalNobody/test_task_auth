import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';
import 'package:test_task_auth/data/services/auth_service.dart';
import 'package:test_task_auth/ui/widgets/app_pin_button.dart';

import '../../../l10n/generated/l10n.dart';

class PinEnterViewModel extends BaseViewModel {
  PinEnterViewModel(BuildContext context) {
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

  Future<void> onReady() async {
    showBiometrics.add(await checkBiometricsAvailability());
  }

  Future<void> login() async {
    final res = authService.login(pin);
    if (!res) {
      showError();
      notifyListeners();
      await showPlatformDialog(
        context: navigator.context,
        builder: (_) => PlatformAlertDialog(
          title: Text(Strings.current.error),
          content: Text(Strings.current.check_correct_pin),
          actions: [
            PlatformDialogAction(
              onPressed: () => navigator.pop(),
              child: PlatformText(Strings.current.close),
            ),
          ],
        ),
      );
      clearPin();
    }
  }

  void onPinTap(int number) {
    pinError.add(false);
    pin += number.toString();
    if (pin.length >= pinLength) {
      login();
      return;
    }
    notifyListeners();
  }

  void clearPin() {
    pin = '';
    pinError.add(false);
    notifyListeners();
  }

  void showError() {
    pinError.add(true);
    notifyListeners();
    Future<void>.delayed(const Duration(seconds: 1)).then((_) {
      pinError.add(false);
      notifyListeners();
    });
  }

  Future<void> onBiometricsTap(AppPinButtonState state) async {
    if (state == AppPinButtonState.active) {
      final res = await authWithBiometrics();
      if (res) {
        authService.login('', viaBiometrics: true);
      } else {
        showPlatformDialog(
          context: navigator.context,
          builder: (_) => PlatformAlertDialog(
            title: Text(Strings.current.error),
            content: Text(Strings.current.biometrics_auth_failed),
            actions: [
              PlatformDialogAction(
                onPressed: () => navigator.pop(),
                child: PlatformText(Strings.current.close),
              ),
            ],
          ),
        );
      }
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
