import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  CustomButton({super.key,this.onTap, required this.text});
  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Color(0xff2B475E), fontSize: 22),
          ),
        ),
      ),
    );
  }
}
