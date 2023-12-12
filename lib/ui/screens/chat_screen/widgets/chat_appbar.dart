import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

AppBar buildChatScreenAppBar(BuildContext context) {
  return AppBar(
    elevation: 0.3,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light),
    leading: Padding(
      padding: EdgeInsets.only(
          left: AppDimensions.width16, top: AppDimensions.height20),
      child: Text(
        'Distro Chat',
        style: GoogleFonts.montserrat(
            fontSize: AppDimensions.height20, fontWeight: FontWeight.w600, color: colorPrimary),
      ),
    ),
    leadingWidth: AppDimensions.getProportionateScreenWidth(150),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: colorIcon,
            size: 22.sp,
          )),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: colorPrimary,
            size: 22.sp,
          ))
    ],
  );
}
