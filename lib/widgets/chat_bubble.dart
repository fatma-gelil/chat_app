
import 'package:chat_ui_setup/constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // height: 65,
        // width: 150,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
       // alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: kPrimraryColor
        ),
        child: Text('mffmgsfojbsfo',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
