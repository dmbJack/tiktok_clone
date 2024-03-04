import 'package:flutter/material.dart';
import 'package:tiktok_clone/src/config/app_theme.dart';
import 'src/config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'TikTok Clone',
        theme: CustomTheme().theme(),
        routerConfig: AppRouter().router,
      );
  }
}
