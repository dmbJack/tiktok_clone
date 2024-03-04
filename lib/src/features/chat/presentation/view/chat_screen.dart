import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Chat"),),
        body: Center(child: Container(width: 100,height: 100, color: Colors.green,),),
    );
  }
}