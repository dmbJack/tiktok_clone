import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feed"),
      ),
        body: Center(child: Container(width: 100,height: 100, color: Colors.blue,),),
      // bottomNavigationBar: const CustomNavBar(),
    );
  }
}
