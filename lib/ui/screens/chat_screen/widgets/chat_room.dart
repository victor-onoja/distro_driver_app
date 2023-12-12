import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/chat_screen/widgets/received_message.dart';
import 'package:distro_driver_v2/ui/screens/chat_screen/widgets/sent_message.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'chat_room_appbar.dart';
import 'new_message_field.dart';

class ChatRoom extends StatefulWidget {
  static const String routeName = '/chatRoom';

  //todo: this should be done via state management
  final Map<String, dynamic> messageUsers;
  const ChatRoom({super.key, required this.messageUsers});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //buildChatTitlePrompt(context);
      return;
    });

    return Scaffold(
      appBar: buildChatRoomAppBar(context,
          messengerName: widget.messageUsers['name']),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimensions.height16 / 2),
          Center(
            child: Column(
              children: [
                Text(
                  'You ended this chat',
                  style: subHeadingTextStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: AppDimensions.height16 / 2),

                //Divider
                SizedBox(
                  width: double.infinity,
                  child: Divider(
                    thickness: AppDimensions.getProportionateScreenHeight(1),
                    height: 2,
                    color: colorLightGrey,
                  ),
                ),
                SizedBox(height: AppDimensions.height2),

                //Chat title
                Text(
                  widget.messageUsers['chat']['chatTitle'],
                  style:
                      subHeadingTextStyle.copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: AppDimensions.height2 * 2),

                //Date (fixed for now)
                Text(
                  'May 16',
                  style: subHeadingTextStyle.copyWith(
                      fontSize: 12.px, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(height: AppDimensions.height14),

          //Messages
          Expanded(
            child: ListView.builder(
                //shrinkWrap: true,
                itemCount: widget.messageUsers['chat']['messages'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppDimensions.width16,
                    ),
                    child: Column(
                      children: [
                        !widget.messageUsers['chat']['messages'][index]
                                ['isSentByMe']
                            ? ReceivedMessage(
                                userImg: widget.messageUsers['userImg'],
                                message: widget.messageUsers['chat']['messages']
                                    [index]['textMessage'],
                              )
                            : SentMessage(
                                userImg: widget.messageUsers['userImg'],
                                message: widget.messageUsers['chat']['messages']
                                    [index]['textMessage']),
                        SizedBox(height: AppDimensions.height20)
                      ],
                    ),
                  );
                }),
          ),

          !widget.messageUsers['chat']['hasEnded']
              ? Column(
                  children: [
                    SizedBox(
                        height: AppDimensions.getProportionateScreenHeight(50)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Are you done with conversation?',
                        style: bodyTextStyle,
                      ),
                      SizedBox(width: AppDimensions.width10 / 2),
                      GestureDetector(
                        onTap: () {
                          print(widget.messageUsers['chat']['hasEnded']);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Are you sure you want to end chat',
                                      style: headingTextStyle.copyWith(
                                          fontSize: AppDimensions
                                              .getProportionateScreenHeight(17),
                                          fontWeight: FontWeight.w500)),
                                  actions: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: AppDimensions.height10,
                                          horizontal:
                                              AppDimensions.width10 / 2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      colorPrimary),
                                              child: Text(
                                                'No',
                                                style: subHeadingTextStyle
                                                    .copyWith(
                                                  fontSize:
                                                      AppDimensions.height14,
                                                  color: Colors.white,
                                                ),
                                              )),
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  widget.messageUsers['chat']
                                                      ['hasEnded'] = true;
                                                });
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      colorPrimary),
                                              child: Text(
                                                'Yes',
                                                style: subHeadingTextStyle
                                                    .copyWith(
                                                  fontSize:
                                                      AppDimensions.height14,
                                                  color: Colors.white,
                                                ),
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Text(
                          'End Chat',
                          style: bodyTextStyle.copyWith(color: colorPrimary),
                        ),
                      ),
                    ]),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'You ended the chat',
                      style: bodyTextStyle.copyWith(
                        fontSize: AppDimensions.height12,
                      ),
                    ),
                    SizedBox(height: AppDimensions.height14),
                    Divider(
                      thickness: 1,
                      height: 1,
                      color: colorLightGrey,
                    )
                  ],
                ),

          SizedBox(height: AppDimensions.getProportionateScreenHeight(50)),

          //New message TextBox
          ///This should be reactive, so it will be updated when a state management is concluded on
          NewMessageField()
        ],
      ),
    );
  }
}
