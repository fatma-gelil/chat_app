import 'package:chat_ui_setup/constants.dart';
import 'package:chat_ui_setup/models/message_model.dart';
import 'package:chat_ui_setup/widgets/chat_bubble.dart';
import 'package:chat_ui_setup/widgets/chat_bubble_reverse.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static String id = 'ChatScreen';
  final ScrollController scrollController = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollection);
  TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // to return the arguments form login and register
   var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
          }
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
                    reverse: true,
                    controller: scrollController,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id==email? ChatBubble(
                        message: messagesList[index],
                      ):ChatBubbleReverse(message: messagesList[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: chatController,
                    onSubmitted: (message) {
                      messages
                          .add({kMessage: message, kCreatedAt: DateTime.now(),'id':email});
                      chatController.clear();
                      scrollController.animateTo(0,
                          duration: Duration(seconds: 1), curve: Curves.easeIn);
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
        } else {
          return CircularProgressIndicator(
            strokeWidth: 3,
          );
        }
      },
    );
  }
}
