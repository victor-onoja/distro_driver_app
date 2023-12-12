import 'message_model.dart';

class ChatModel {
  final String chatTitle;
  final bool hasEnded;
  final List<Message> messages;

  ChatModel({
    required this.chatTitle,
    required this.hasEnded,
    required this.messages,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> userMessages = json['messages'];

    List<Message> messages = userMessages.keys
        .map((e) => Message.fromJson(userMessages[e]))
        .toList();

    return ChatModel(
      chatTitle: json['chatTitle'],
      hasEnded: json['hasEnded'],
      messages: messages,
    );
  }

  addMessage(Message message, ChatModel chatModel) {
    chatModel.messages.insert(0, message);
  }
}

///Demo Messages
///

List<Map<String, dynamic>> messages = [
  {
    'textMessage': 'Hey What, how are you today?',
    'senderId': 'user1',
    'senderUserName': 'sender1',
    'receiverId': 'user2',
    'timeStamp': DateTime.now().subtract(const Duration(days: 5)),
    'isSentByMe': true
  },
  {
    'textMessage': 'Hey What, how are you today?',
    'senderId': 'user1',
    'senderUserName': 'sender1',
    'receiverId': 'user2',
    'timeStamp': DateTime.now().subtract(const Duration(days: 5)),
    'isSentByMe': true
  },
  {
    'textMessage': 'Hey What, how are you today?',
    'senderId': 'user1',
    'senderUserName': 'sender1',
    'receiverId': 'user2',
    'timeStamp': DateTime.now().subtract(const Duration(days: 5)),
    'isSentByMe': true
  },
  {
    'textMessage': 'Hey I\'m good, you?',
    'senderId': 'user2',
    'senderUserName': 'sender2',
    'receiverId': 'user1',
    'timeStamp': DateTime.now().subtract(const Duration(days: 5)),
    'isSentByMe': false
  },
  {
    'textMessage': 'Boss, I want to get a new car',
    'senderId': 'user1',
    'senderUserName': 'sender1',
    'receiverId': 'user2',
    'timeStamp': DateTime.now().subtract(const Duration(days: 3)),
    'isSentByMe': true
  },
  {
    'textMessage': 'You deal all states?',
    'senderId': 'user1',
    'senderUserName': 'sender1',
    'receiverId': 'user2',
    'timeStamp': DateTime.now().subtract(const Duration(days: 3)),
    'isSentByMe': true
  },
  {
    'textMessage':
        'Yeah, sure. What\'s your taste?\n What bran do you have in mind?',
    'senderId': 'user2',
    'senderUserName': 'sender2',
    'receiverId': 'user1',
    'timeStamp': DateTime.now().subtract(const Duration(days: 3)),
    'isSentByMe': false
  },
  {
    'textMessage': 'Hmmm, I\'m thinking of getting a Lambo this time',
    'senderId': 'user1',
    'senderUserName': 'sender1',
    'receiverId': 'user2',
    'timeStamp': DateTime.now().subtract(const Duration(days: 3)),
    'isSentByMe': true
  },
  {
    'textMessage': 'Sure, we\'ve got all varieties of vehicles here',
    'senderId': 'user2',
    'senderUserName': 'sender2',
    'receiverId': 'user1',
    'timeStamp': DateTime.now().subtract(const Duration(days: 2)),
    'isSentByMe': false
  },
  {
    'textMessage': 'Sport or Luxury or a combo',
    'senderId': 'user2',
    'senderUserName': 'sender2',
    'receiverId': 'user1',
    'timeStamp': DateTime.now().subtract(const Duration(days: 2)),
    'isSentByMe': false
  },
];

Map<String, dynamic> chat = {
  'chatTitle': 'I have Pending Transaction',
  'hasEnded': false,
  'messages': messages.reversed.toList(),
};
