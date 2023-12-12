import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/app_drawer/widgets/drawer_tile_group.dart';
import 'package:distro_driver_v2/ui/screens/home_screen/widgets/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.currentPage,
    required this.tabController,
    required this.tabController2,
  });

  final ValueNotifier<int> currentPage;
  final TabController tabController;
  final TabController tabController2;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> accountSettings = [
      {'icon': 'assets/icons/profile_icon.svg', 'title': "Personal Info"},
      {'icon': 'assets/icons/order_history_icon.svg', 'title': "Order History"},
      {'icon': 'assets/icons/language_icon.svg', 'title': "Language"},
      {
        'icon': 'assets/icons/push_notification_icon.svg',
        'title': "Push Notification"
      },
    ];
    List<Map<String, dynamic>> support = [
      {'icon': 'assets/icons/chat_icon.svg', 'title': "Message Distro"},
      {'icon': 'assets/icons/about_icon.svg', 'title': "About Distro"},
      {'icon': 'assets/icons/logout_icon.svg', 'title': "Log Out"},
    ];
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.width16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(right: AppDimensions.width16 / 2),
                    child: SvgPicture.asset('assets/icons/cancel.svg'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    //Todo: show profile image
                  },
                  child: CircleAvatar(
                    radius: AppDimensions.height10 * 3.4,
                    backgroundImage:
                        const AssetImage('assets/images/profile_image.png'),
                  ),
                ),
                kWidth(AppDimensions.height24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(text: 'John Johnson'),
                    Text(
                      'Driver',
                      style: subHeadingTextStyle,
                    ),
                  ],
                )
              ],
            ),
            kHeight(AppDimensions.height24),
            ProfileTileGroup(
              groupList: accountSettings,
              groupTitle: 'Account Settings',
              tabController: tabController,
              currentPage: currentPage,
              tabController2: tabController2,
            ),
            ProfileTileGroup(
              groupList: support,
              groupTitle: 'Support',
              tabController: tabController,
              currentPage: currentPage,
              tabController2: tabController2,
            )
          ],
        ),
      ),
    );
  }
}
