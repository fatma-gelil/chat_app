import 'package:chat_ui_setup/constants.dart';
import 'package:chat_ui_setup/screens/chat_screen.dart';
import 'package:chat_ui_setup/validator.dart';
import 'package:chat_ui_setup/widgets/custom_button.dart';
import 'package:chat_ui_setup/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static String id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  GlobalKey<FormState> signupKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimraryColor,
        body: Form(
          key: signupKey,
          child: ListView(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: CustomTextFormField(
                  validator: (value) {
                    return MyValidators.emailValidator(value);
                  },
                  text: 'Email',
                  controller: email,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: CustomTextFormField(
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
                  text: 'password',
                  obsecureText: true,
                  controller: password,
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                  child: CustomButton(
                    text: 'Sign up',
                    onTap: () async {
                      if (signupKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await signupAuthentication();
                          showSnackbar(context, 'Signed up successfully');
                          Navigator.pushNamed(context, ChatScreen.id,arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackbar(
                                context, 'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackbar(context,
                                'The account already exists for that email.');
                          }
                        }
                        isLoading = false;
                        setState(() {});

                        //print(user.user!.email);
                      } else {
                        //
                      }
                    },
                  ),
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
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> signupAuthentication() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
  }
}
