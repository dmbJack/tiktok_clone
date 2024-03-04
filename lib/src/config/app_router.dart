import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/src/features/auth/presentation/view/signin_screen.dart';
import 'package:tiktok_clone/src/features/auth/presentation/view/signup_screen.dart';
import 'package:tiktok_clone/src/features/chat/presentation/view/chat_screen.dart';
import 'package:tiktok_clone/src/features/feed/presentation/view/discover_screen.dart';
import 'package:tiktok_clone/src/features/feed/presentation/view/feed_screen.dart';
import '../shared/presentation/widgets/widgets.dart';

class AppRouter {
  AppRouter();
  late GoRouter router = GoRouter(routes: [
    //Utiliser ShellRoute pour pouvoir ajouter le bottomNavigationBar
    //au lieu de mettre le bottomNavigationBar sur chaque page
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomNavBar(
            // 0: Feed, 1: Discover, 2: Add, 3: Chat
            //Je renvoie l'index de la page actuelle en fonction de l'url
            //Ex: /discover renvoie l'index 1
            pageIndex: switch (state.matchedLocation) {
              '/' => 0,
              '/discover' => 1,
              '/add' => 2,
              '/chat' => 3,
              String() => null,
            },
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'feed',
          //Utiliser pageBuilder lorsque vous voulez ajouter une animation entre les pages
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 200),
            child: const FeedScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation,
                    child) =>
                FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.easeInBack).animate(animation),
                    child: child),
          ),
        ),
        GoRoute(
          path: '/discover',
          name: 'discover',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 200),
            child: const DiscoverScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation,
                    child) =>
                FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.easeInSine).animate(animation),
                    child: child),
          ),
        ),
        GoRoute(
          path: '/chat',
          name: 'chat',
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 200),
            child: const ChatScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation,
                    child) =>
                FadeTransition(
                    opacity:
                        CurveTween(curve: Curves.easeInSine).animate(animation),
                    child: child),
          ),
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
