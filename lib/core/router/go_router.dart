import 'package:go_router/go_router.dart';
import 'package:notif/presentation/pages/home/home_screen.dart';

final GoRouter goRouter = GoRouter(
  observers: [],
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
      routes: <RouteBase>[
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routeName,
          builder: (_, __) => const HomeScreen(),
        ),
      ],
    ),
  ],
);
