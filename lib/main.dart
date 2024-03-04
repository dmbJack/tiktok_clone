import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/src/config/app_theme.dart';
import 'package:tiktok_clone/src/shared/controller/navigation/navigation_cubit.dart';
import 'src/config/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NavigationCubit(),
      child: MaterialApp.router(
        title: 'TikTok Clone',
        theme: CustomTheme().theme(),
        routerConfig: AppRouter().router,
      ),
    );
  }
}
