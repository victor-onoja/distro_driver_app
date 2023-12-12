import 'package:distro_driver_v2/models/chat_model.dart';

class Messenger {
  final String name;
  final ChatModel chats;
  final String userImg;
  final bool isOpened;

  Messenger({
    required this.name,
    required this.chats,
    required this.userImg,
    required this.isOpened,
  });

  factory Messenger.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> userChat = json['chats'] ?? {};

    ChatModel chats = ChatModel.fromJson(userChat);

    return Messenger(
      name: json['name'],
      chats: chats,
      userImg: json['userImg'],
      isOpened: json['isOpened'],
    );
  }
}
