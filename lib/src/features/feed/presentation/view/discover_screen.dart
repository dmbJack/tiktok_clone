import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
      ),
      body: Center(child: Container(width: 100,height: 100, color: Colors.red,),),
      // bottomNavigationBar: const CustomNavBar(),
    );
  }
}
