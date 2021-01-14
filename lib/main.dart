import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_task_auth/data/repository/auth_repository.dart';
import 'package:provider/provider.dart';

import 'data/services/auth_service.dart';
import 'ui/app.dart';

Future<void> main() async {
  await GetStorage.init();
  run();
}

void run() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (ctx) => AuthRepository()),
        Provider(
          create: (ctx) => AuthService(
            ctx.read<AuthRepository>(),
          ),
        ),
      ],
      child: App(),
    ),
  );
}
