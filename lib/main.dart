import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/base/database/sharedpref.dart';
import 'package:techjartask/core/provider/app_providers.dart';
import 'package:techjartask/core/router/app_router.dart';

import 'core/theme/theme.dart';

Future main() async {
  // Binding has been initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPrefs instance.
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders,
      child: MaterialApp.router(
        routerConfig: AppRouter().appRouter,
        key: navigatorKey,
        title: 'TechJar Task',
        theme: AppTheme.getLightAppThemeData,
      ),
    );
  }
}
