import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:test_task_auth/data/services/auth_service.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel(BuildContext context) {
    navigator = Navigator.of(context);
    authService = context.read<AuthService>();
  }
  NavigatorState navigator;
  AuthService authService;

  Future<void> logout() async {
    authService.logout();
  }

  Future<void> login() async {
    authService.clearLoggedIn();
  }
}
