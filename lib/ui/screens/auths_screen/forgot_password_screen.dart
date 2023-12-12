import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/login_screen.dart';
import 'package:distro_driver_v2/ui/widgets/bordered_textfield.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgot_password_screen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fEmail = TextEditingController();
    final fNumber = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: headingTextStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          kHeight(8.h),
          Text(
            "Enter your registered email or phone number below",
            style: subHeadingTextStyle,
          ),
          kHeight(4.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: fEmail,
              hintText: "Email Address ",
              // obscureText: true,
            ),
          ),
          kHeight(4.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: fNumber,
              hintText: "Phone number ",
              // obscureText: true,
            ),
          ),
          kHeight(10.h),
          CustomButton(
            onPress: () {},
            title: "Submit",
            width: 88.w,
            height: 7.h,
          ),
          kHeight(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Remember the password?",
                style: normalTextStyle,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    "Sign in",
                    style: normalPrimaryStyle,
                  ))
            ],
          )
        ],
      )),
    );
  }
}
