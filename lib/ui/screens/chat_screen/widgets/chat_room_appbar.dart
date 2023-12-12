import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

AppBar buildChatRoomAppBar(BuildContext context,
    {required String messengerName}) {
  return AppBar(
    backgroundColor: colorPrimary,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: colorPrimary,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
    title: Padding(
      padding: EdgeInsets.only(
          bottom: AppDimensions.getProportionateScreenHeight(8)),
      child: Row(
        children: [
          Container(
              height: AppDimensions.getProportionateScreenHeight(50),
              width: AppDimensions.getProportionateScreenWidth(50),
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.width10),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/logo.png')),
          SizedBox(width: AppDimensions.width16 / 2),
          Text(
            messengerName,
            style: headingTextStyle.copyWith(
                color: Colors.white, fontSize: AppDimensions.height20),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 22.sp,
          ))
    ],
  );
}
