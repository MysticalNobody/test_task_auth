import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_task_auth/l10n/generated/l10n.dart';
import 'package:test_task_auth/ui/views/root/root_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        Strings.delegate,
      ],
      supportedLocales: Strings.delegate.supportedLocales,
      home: RootView(),
    );
  }
}
