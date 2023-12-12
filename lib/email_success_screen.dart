import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/login_screen.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmailSuccessScreen extends StatelessWidget {
  static const String routeName = '/email_successful_screen';
  const EmailSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            // how to push the button to the end
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  kHeight(6.h),
                  SvgPicture.asset(
                    // ImgAssets.imgShipmentTwo,
                    'assets/images/success_check.svg',
                    height: 12.h,
                    // width: 95.w,

                    // height: ScreenHeight(context),
                  ),
                  kHeight(3.h),
                  Text(
                    "Success",
                    style: headingTextStyle,
                  ),
                  kHeight(1.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.sp),
                    child: Text(
                      "Please check your email or SMS for create a new password",
                      style: subHeadingTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),

              // Spacer(),

              Column(
                children: [
                  CustomButton(
                    onPress: () {},
                    height: 6.h,
                    width: 95.w,
                    title: "Back to Email",
                  ),
                  kHeight(4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Can't get email or SMS? ",
                        style: normalTextStyle,
                      ),
                      TextButton(
                          onPressed: () {
                            // Navigator.of(context)
                            //     .pushNamed(LoginScreen.routeName);
                          },
                          child: Text(
                            "Resubmit",
                            style: normalPrimaryStyle,
                          ))
                    ],
                  )
                ],
              )
            ]),
      ),
    );
  }
}
