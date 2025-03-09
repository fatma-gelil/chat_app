import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
   CustomTextFormField(
      {super.key,
      required this.text,
      this.obsecureText=false,
      this.onchanged,
      this.controller,
      required this.validator});
  final String? text;
  bool? obsecureText;
  final Function(String)? onchanged;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText!,
      validator: validator,
      onChanged: onchanged,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.white, fontSize: 18),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
    );
  }
}
