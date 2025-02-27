import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.text, this.onchanged});
  String? text;
  Function(String)? onchanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onchanged,
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
