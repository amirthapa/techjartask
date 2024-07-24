import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:techjartask/core/provider/app_providers.dart';
import 'package:techjartask/core/router/app_router.dart';

import 'core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders,
      child: OverlaySupport(
        key: navigatorKey,
        child: MaterialApp.router(
          routerConfig: AppRouter().appRouter,
          key: navigatorKey,
          title: 'TechJar Task',
          theme: AppTheme.getLightAppThemeData,
        ),
      ),
    );
  }
}
