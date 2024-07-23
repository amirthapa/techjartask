import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:techjartask/core/router/app_router.dart';
import 'package:techjartask/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

/// GlobalKey for navigation
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      key: navigatorKey,
      child: MaterialApp.router(
        routerConfig: AppRouter().appRouter,
        title: 'TechJar Task',
        theme: AppTheme.getLightAppThemeData,
      ),
    );
  }
}
