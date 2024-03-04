import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/widgets.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
