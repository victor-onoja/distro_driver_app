import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6.h),
          SvgPicture.asset(
            "assets/icons/onboard3.svg",
          ),
          Text(
            "Become a Distro Driver",
            textAlign: TextAlign.center,
            style: headingTextStyle2,
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed qu",
              textAlign: TextAlign.center,
              style: subHeadingTextStyle3,
            ),
          )
        ],
      )),
    );
  }
}
