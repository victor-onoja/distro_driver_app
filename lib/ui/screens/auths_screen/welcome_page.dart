import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/login_screen.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/registeration_screen.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome_screen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome!",
          style: headingTextStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 14.h,
          ),
          Center(
              child: CustomButton(
            onPress: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
            width: 85.w,
            height: 7.h,
            title: "Sign In",
          )),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "OR",
            style: subHeadingTextStyle3,
          ),
          SizedBox(
            height: 3.h,
          ),
          Center(
              child: CustomButton(
            onPress: () {
              Navigator.of(context).pushNamed(SignUpScreen.routeName);
            },
            width: 85.w,
            height: 7.h,
            buttonColor: colorWhite,
            textColor: colorPrimary,
            title: "Sign Up",
          )),
        ],
      ),
    );
  }
}
