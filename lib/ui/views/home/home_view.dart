import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:test_task_auth/l10n/generated/l10n.dart';
import 'package:test_task_auth/ui/views/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(context),
      builder: (context, HomeViewModel model, child) {
        return Scaffold(
            body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 24),
              PlatformButton(
                onPressed: model.logout,
                child: Text(Strings.current.reset_pin),
              ),
              const SizedBox(height: 24),
              PlatformButton(
                onPressed: model.login,
                child: Text(Strings.current.auth),
              ),
            ],
          ),
        ));
      },
    );
  }
}
