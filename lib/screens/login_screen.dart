import 'package:chat_ui_setup/constants.dart';
import 'package:chat_ui_setup/widgets/custom_button.dart';
import 'package:chat_ui_setup/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimraryColor,
      body: ListView(
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(child: Image.asset('assets/images/scholar.png')),
          const Center(
            child: Text(
              'Scholar Chat',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'pacifico',
                  fontSize: 34),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: CustomTextField(text: 'Email'),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: CustomTextField(text: 'password')),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              child: CustomButton(
                text: 'Login',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "don't have an account?",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('SignupScreen');
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
