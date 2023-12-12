import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../models/chat_model.dart';
import '../../../../models/message_model.dart';

class NewMessageField extends StatefulWidget {
  const NewMessageField({super.key});

  @override
  State<NewMessageField> createState() => _NewMessageFieldState();
}

class _NewMessageFieldState extends State<NewMessageField> {

  late final TextEditingController newMessageController;

  @override
  void initState() {
    super.initState();
    newMessageController = TextEditingController();
  }

  @override
  void dispose() {
    newMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width10,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: AppDimensions.width16,
          vertical: AppDimensions.height10),
      child: TextFormField(
        controller: newMessageController,
        decoration: InputDecoration(
          hintText: 'Message',
          hintStyle: subHeadingTextStyle.copyWith(
              fontSize: 15.px, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 1, color: colorLightGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
              const BorderSide(width: 1, color: colorLightGrey)),
        ),
        onFieldSubmitted: (val) {
          onNewMessageSubmitted(newMessageController);
        },
      ),
    );
  }

  void onNewMessageSubmitted(TextEditingController controller) {
    final newMessage = Message(
        textMessage: controller.text,
        senderId: 'user1',
        senderUserName: 'user1',
        receiverId: '1',
        timeStamp: DateTime.now(),
        isSentByMe: true);

    if (newMessage.textMessage.isNotEmpty) {
      //todo: This needs to be observable
      messages.add(newMessage.toJson());
    }

    controller.clear();
  }

}
