import 'package:chat_ui_setup/constants.dart';

class MessageModel {
  final String id;
  final String message;
  MessageModel(this.id,this.message);

  factory MessageModel.fromJson(jsonData) {
    return MessageModel(jsonData[kMessage],jsonData['id']);
  }
}
