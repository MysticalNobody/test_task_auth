import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:test_task_auth/ui/theme/theme.dart';
import 'package:test_task_auth/ui/views/home/home_view.dart';
import 'package:test_task_auth/ui/views/pin_enter/pin_enter_view.dart';
import 'package:test_task_auth/ui/views/pin_set/pin_set_view.dart';

import 'root_view_model.dart';

class RootViewRoute extends MaterialPageRoute {
  RootViewRoute() : super(builder: (context) => RootView());
}

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _RootView();
  }
}

class _RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RootViewModel>.reactive(
      viewModelBuilder: () => RootViewModel(context),
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) {
        return DecoratedBox(
          decoration: const BoxDecoration(color: AppColors.bg),
          child: Builder(
            builder: (_) {
              if (!model.isLoggedIn) {
                if (model.hasPin) {
                  return PinEnterView();
                } else {
                  return PinSetView();
                }
              } else {
                return HomeView();
              }
            },
          ),
        );
      },
    );
  }
}
