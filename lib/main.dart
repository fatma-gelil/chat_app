import 'package:chat_ui_setup/constants.dart';
import 'package:chat_ui_setup/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Chatty());
}

class Chatty extends StatelessWidget {
  const Chatty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(),);
  }
}
