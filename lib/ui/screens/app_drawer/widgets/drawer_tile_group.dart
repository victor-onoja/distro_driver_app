import 'package:distro_driver_v2/ui/screens/language/language_screen.dart';
import 'package:distro_driver_v2/ui/screens/personal_info_screen/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/screen_utils.dart';
import '../../../../core/constants/text_styles.dart';

class ProfileTileGroup extends StatefulWidget {
  const ProfileTileGroup({
    super.key,
    required this.groupList,
    required this.groupTitle,
    required this.tabController,
    required this.tabController2,
    required this.currentPage,
  });

  final List<Map<String, dynamic>> groupList;
  final String groupTitle;
  final TabController tabController;
  final TabController tabController2;
  final ValueNotifier<int> currentPage;

  @override
  State<ProfileTileGroup> createState() => _ProfileTileGroupState();
}

class _ProfileTileGroupState extends State<ProfileTileGroup> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.groupTitle,
          style: headingTextStyle.copyWith(fontSize: 18.sp),
        ),
        kHeight(AppDimensions.height16),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.groupList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onTileTap(context, widget.groupList[index]['title']);
                    }, //onTileTap(context, groupList[index]['title']),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          widget.groupList[index]['icon'],
                          colorFilter: const ColorFilter.mode(
                              colorPrimary, BlendMode.srcIn),
                        ),
                        kWidth(AppDimensions.width10),
                        Text(
                          widget.groupList[index]['title'],
                          style: subHeadingTextStyle3.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        if (widget.groupList[index]['title'] ==
                            "Push Notification")
                          Switch(
                            value: switchState,
                            activeColor: colorPrimary,
                            onChanged: (value) {
                              setState(() {
                                switchState = value;
                              });
                              //todo: activate or deactivate button
                            },
                          )
                      ],
                    ),
                  ),
                  index == 4
                      ? SizedBox(height: AppDimensions.height20)
                      : SizedBox(
                          height:
                              AppDimensions.getProportionateScreenHeight(27))
                ],
              );
            }),
      ],
    );
  }

  onTileTap(BuildContext context, String tileTitle) {
    switch (tileTitle) {
      case 'Personal Info':
        Navigator.of(context).pushNamed(PersonalInfoScreen.routeName);
        break;
      case 'Order History':
        setState(() {
          widget.currentPage.value = 1;
          widget.tabController.animateTo(2,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        });
        Navigator.of(context).pop();
      case 'Language':
        Navigator.of(context).pushNamed(LanguageScreen.routeName);
      case 'Message Distro':
        setState(() {
          widget.currentPage.value = 2;
          widget.tabController2.animateTo(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
        });
        Navigator.pop(context);

        break;
    }
  }
}
