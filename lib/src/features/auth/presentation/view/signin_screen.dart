import 'package:flutter/material.dart';
import 'package:tiktok_clone/src/shared/presentation/widgets/custom_nav_bar.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Sign In"),),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}