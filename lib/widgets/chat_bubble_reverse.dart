
import 'package:chat_ui_setup/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubbleReverse extends StatelessWidget {
  const ChatBubbleReverse({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
       
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color: Color(0xff006D84)),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
