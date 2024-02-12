import 'package:go_router/go_router.dart';
import 'package:notif/presentation/pages/home/home_screen.dart';
import 'package:notif/presentation/pages/login/login_layout.dart';
import 'package:notif/presentation/pages/login/login_screen.dart';

final GoRouter goRouter = GoRouter(
  observers: [],
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (_, __) => const LoginLayout(),
      routes: <RouteBase>[
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routeName,
          builder: (_, __) => const LoginLayout(),
        ),
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routeName,
          builder: (_, __) => const HomeScreen(),
        ),
      ],
    ),
  ],
);
