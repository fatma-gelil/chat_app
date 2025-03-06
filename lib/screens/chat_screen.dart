import 'package:chat_ui_setup/constants.dart';
import 'package:chat_ui_setup/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: messages.doc('KH3Apm0TtnlVGaRmix6x').get(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimraryColor,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    klogo,
                    width: 50,
                  ),
                  Text(
                    ' Chat',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ChatBubble();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: chatController,
                    onSubmitted: (message) {
                      messages.add({'message': message});
                      chatController.clear();
                    },
                    decoration: InputDecoration(
                      hintText: 'Send message...',
                      suffixIcon: Icon(
                        Icons.send,
                        color: kPrimraryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: kPrimraryColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
