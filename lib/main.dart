import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sonda/ui/screens/details_screen.dart';
import 'package:sonda/ui/screens/home_screen.dart';

void main() => runApp(const Sonda());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
      ],
    ),
  ],
);

class Sonda extends StatelessWidget {
  const Sonda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
