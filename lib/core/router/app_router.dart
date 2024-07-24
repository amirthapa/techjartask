import 'package:go_router/go_router.dart';
import 'package:techjartask/core/router/router_helper.dart';
import 'package:techjartask/features/details/ui/detials_screen.dart';
import 'package:techjartask/features/home/ui/home_screen.dart';

class AppRouter {
  final _router = GoRouter(
    initialLocation: AppPages.home.toPath,
    routes: [
      GoRoute(
        path: AppPages.home.toPath,
        name: AppPages.home.toName,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppPages.postDetails.toPath,
        name: AppPages.postDetails.toName,
        builder: (context, state) => const DetailsScreen(),
      ),
    ],
  );

  GoRouter get appRouter => _router;
}
