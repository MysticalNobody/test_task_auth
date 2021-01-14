import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

import '../../../data/repository/auth_repository.dart';

class RootViewModel extends BaseViewModel {
  RootViewModel(BuildContext context) {
    navigator = Navigator.of(context);

    authRepository = context.read<AuthRepository>();
    authRepository.isLoggedIn.listen((isLoggedIn) {
      this.isLoggedIn = isLoggedIn;
      notifyListeners();
    });
    authRepository.pin.listen((newVal) {
      notifyListeners();
    });
  }
  NavigatorState navigator;
  AuthRepository authRepository;

  bool isLoggedIn = false;
  bool get hasPin => authRepository.pin?.val != null;

  Future<void> onReady() async {}
}
