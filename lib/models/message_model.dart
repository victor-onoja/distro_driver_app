class Message {
  final String textMessage;
  final String senderId;
  final String senderUserName;
  final String receiverId;
  final DateTime timeStamp;
  final bool isSentByMe;

  Message(
      {required this.textMessage,
      required this.senderId,
      required this.senderUserName,
      required this.receiverId,
      required this.timeStamp,
      required this.isSentByMe});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        textMessage: json['textMessage'],
        senderId: json['senderId'],
        senderUserName: json['senderUserName'],
        receiverId: json['receiverId'],
        timeStamp: json['timeStamp'],
        isSentByMe: json['isSentByMe']);
  }

  Map<String, dynamic> toJson() {
    return {
      'textMessage': textMessage,
      'senderId': senderId,
      'senderUserName': senderUserName,
      'receiverId': receiverId,
      'timeStamp': timeStamp,
      'isSentByMe': isSentByMe
    };
  }
}
