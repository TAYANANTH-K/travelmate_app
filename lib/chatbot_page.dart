import 'package:flutter/material.dart';

class ChatbotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Chatbot Interface Here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
