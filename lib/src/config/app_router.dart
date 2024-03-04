import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/main.dart';
import 'package:tiktok_clone/src/features/auth/presentation/view/signin_screen.dart';
import 'package:tiktok_clone/src/features/auth/presentation/view/signup_screen.dart';
import 'package:tiktok_clone/src/features/feed/presentation/view/discover_screen.dart';
import 'package:tiktok_clone/src/features/feed/presentation/view/feed_screen.dart';

import '../shared/presentation/widgets/widgets.dart';

class AppRouter {
  AppRouter();
  late GoRouter router = GoRouter(routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomNavBar( pageIndex: switch (state.matchedLocation) {
            '/' => 0,
            '/discover' => 1,
            '/add' => 2,
            '/chat' => 3,
            String() => null,
          },),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'feed',
          // builder: (BuildContext context, GoRouterState state) {
          //   return const FeedScreen();
          // },
          pageBuilder: (context, state) => CustomTransitionPage(
            child:  const FeedScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: '/discover',
          name: 'discover',
          pageBuilder: (context, state) => CustomTransitionPage(
            child:  const DiscoverScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
          // builder: (BuildContext context, GoRouterState state) {
          //   return const DiscoverScreen();
          // },
        ),
      ],
    ),
    GoRoute(
      path: '/signin',
      name: 'signin',
      builder: (BuildContext context, GoRouterState state) {
        return const SigninScreen();
      },
      routes: [
        GoRoute(
          path: 'signup',
          name: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignupScreen();
          },
        ),
      ],
    ),
  ]);
}

class GoRouterRefreshStream extends ChangeNotifier {
  /// Creates a [GoRouterRefreshStream].
  ///
  /// Every time the [stream] receives an event the [GoRouter] will refresh its
  /// current route.
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
