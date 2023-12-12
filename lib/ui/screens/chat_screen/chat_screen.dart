import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/models/chat_model.dart';
import 'package:distro_driver_v2/ui/screens/chat_screen/widgets/chat_room.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final TabController tabController;
  const ChatScreen({
    super.key,
    required this.tabController,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ///Demo Users
  List<Map<String, dynamic>> messageUsers = [
    {
      'name': 'Cameron Williamson',
      'chat': chat,
      'userImg': 'assets/images/messenger1.png',
      'isOpened': false
    },
    {
      'name': 'Brooklyn Simmons',
      'chat': chat,
      'userImg': 'assets/images/messenger2.png',
      'isOpened': false
    },
    {
      'name': 'Bessie Cooper',
      'chat': chat,
      'userImg': 'assets/images/messenger3.png',
      'isOpened': true
    },
    {
      'name': 'Leslie Alexander',
      'chat': chat,
      'userImg': 'assets/images/messenger4.png',
      'isOpened': true
    },
    {
      'name': 'Jerome Bell',
      'chat': chat,
      'userImg': 'assets/images/messenger5.png',
      'isOpened': true
    },
    {
      'name': 'Robert Fox',
      'chat': chat,
      'userImg': 'assets/images/messenger6.png',
      'isOpened': true
    },
    {
      'name': 'Arlene McCoy',
      'chat': chat,
      'userImg': 'assets/images/messenger7.png',
      'isOpened': true
    },
    {
      'name': 'Arlene McCoy',
      'chat': chat,
      'userImg': 'assets/images/messenger7.png',
      'isOpened': true
    },
    {
      'name': 'Arlene McCoy',
      'chat': chat,
      'userImg': 'assets/images/messenger7.png',
      'isOpened': true
    },
  ];
  List<Map<String, dynamic>> messageUsersAdmin = [
    {
      'name': 'Distro Admin',
      'chat': chat,
      'userImg': 'assets/images/logo.png',
      'isOpened': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TabBar(
                controller: widget.tabController,
                labelColor: colorPrimary,
                unselectedLabelColor: colorMediumGrey,
                labelStyle: normalTextStyle2,
                indicatorColor: colorPrimary,
                tabs: const [
                  Tab(
                    child: Text(
                      'Customers',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Admin',
                    ),
                  ),
                ])
          ],
        ),
      ),
      body: TabBarView(controller: widget.tabController, children: [
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimensions.getProportionateScreenHeight(15),
                horizontal: AppDimensions.getProportionateScreenWidth(22)),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: messageUsers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: AppDimensions.height20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ChatRoom(
                                  messageUsers: messageUsers[index]);
                            }));
                          },
                          child: Row(
                            children: [
                              Container(
                                width:
                                    AppDimensions.getProportionateScreenWidth(
                                        62),
                                height:
                                    AppDimensions.getProportionateScreenHeight(
                                        62),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            messageUsers[index]['userImg']),
                                        fit: BoxFit.contain)),
                              ),
                              kWidth(AppDimensions.width20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messageUsers[index]['name'],
                                    style: headingTextStyle.copyWith(
                                        color: colorBlackText,
                                        fontSize: AppDimensions.height20),
                                  ),
                                  Text(
                                      messageUsers[index]['chat']['messages'][0]
                                          ['textMessage'],
                                      style: messageUsers[index]['isOpened']
                                          ? headingTextStyle.copyWith(
                                              color: const Color(0xFF686868)
                                                  .withOpacity(0.8),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  AppDimensions.height10 * 1.8)
                                          : headingTextStyle.copyWith(
                                              color: colorBlackText,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: AppDimensions.height10 *
                                                  1.8)),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppDimensions.getProportionateScreenHeight(15),
                horizontal: AppDimensions.getProportionateScreenWidth(22)),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: messageUsersAdmin.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(bottom: AppDimensions.height20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ChatRoom(
                                  messageUsers: messageUsersAdmin[index]);
                            }));
                          },
                          child: Row(
                            children: [
                              Container(
                                width:
                                    AppDimensions.getProportionateScreenWidth(
                                        62),
                                height:
                                    AppDimensions.getProportionateScreenHeight(
                                        62),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            messageUsersAdmin[index]
                                                ['userImg']),
                                        fit: BoxFit.contain)),
                              ),
                              kWidth(AppDimensions.width20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messageUsersAdmin[index]['name'],
                                    style: headingTextStyle.copyWith(
                                        color: colorBlackText,
                                        fontSize: AppDimensions.height20),
                                  ),
                                  Text(
                                      messageUsersAdmin[index]['chat']
                                          ['messages'][0]['textMessage'],
                                      style: messageUsersAdmin[index]
                                              ['isOpened']
                                          ? headingTextStyle.copyWith(
                                              color: const Color(0xFF686868)
                                                  .withOpacity(0.8),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  AppDimensions.height10 * 1.8)
                                          : headingTextStyle.copyWith(
                                              color: colorBlackText,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w400,
                                              fontSize: AppDimensions.height10 *
                                                  1.8)),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        )
      ]),
    );
  }
}
