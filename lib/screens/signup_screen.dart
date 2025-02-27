import 'package:chat_ui_setup/constants.dart';
import 'package:chat_ui_setup/widgets/custom_button.dart';
import 'package:chat_ui_setup/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  static String id = 'SignupScreen';
  String? email;
  String? password;
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
              'Sign up',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: CustomTextField(
              text: 'Email',
              onchanged: (data) {
                email = data;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: CustomTextField(
              text: 'password',
              onchanged: (data) {
                password = data;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
            child: CustomButton(
              onTap: () async {
                UserCredential user = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: email!, password: password!);
                //print(user.user!.email);
              },
              text: 'Sign up',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "already have an account?",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('LoginScreen');
                },
                child: const Text(
                  "Login",
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
