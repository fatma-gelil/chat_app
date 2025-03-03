import 'package:chat_ui_setup/constants.dart';
import 'package:chat_ui_setup/validator.dart';
import 'package:chat_ui_setup/widgets/custom_button.dart';
import 'package:chat_ui_setup/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  GlobalKey<FormState> loginKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimraryColor,
        body: Form(
          key: loginKey,
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
                  'Login',
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
                  controller: password,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (loginKey.currentState!.validate()) {
                    isLoading = true;
                    setState(() {});
                    try {
                      loginAuthentication();
                      showSnackbar(context, 'Logged in successfully');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackbar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showSnackbar(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  } else {
                    // CircularProgressIndicator();
                  }
                  isLoading = false;
                  setState(() {});
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
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
                      Navigator.of(context)
                          .pushReplacementNamed('SignupScreen');
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

  void loginAuthentication() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text);
  }
}
