import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/login_screen.dart';
import 'package:distro_driver_v2/ui/widgets/bordered_textfield.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../home_screen/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = '/signup_screen';
  @override
  Widget build(BuildContext context) {
    final senderNameC2 = TextEditingController();
    final senderNameC3 = TextEditingController();
    final senderNameC4 = TextEditingController();
    final senderNameC5 = TextEditingController();
    final senderNameC6 = TextEditingController();

    var isPasswordVisible = false; // Initialize as false to hide the password
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: headingTextStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          kHeight(6.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: senderNameC2,
              hintText: "First Name ",
              // obscureText: true,
            ),
          ),
          kHeight(2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: senderNameC3,
              hintText: "Last Name ",
              // obscureText: true,
            ),
          ),
          kHeight(2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: senderNameC4,
              hintText: "Email ",
              // obscureText: true,
            ),
          ),
          kHeight(2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: senderNameC5,
              hintText: "Phone Number ",
              // obscureText: true,
            ),
          ),
          kHeight(2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: senderNameC6,
              hintText: "Password ",
              // obscureText: true,
              obscureText: !isPasswordVisible, // Toggle password visibility
              suffixIcon: GestureDetector(
                onTap: () {
                  // Toggle password visibility when the icon is tapped
                  isPasswordVisible = !isPasswordVisible;
                },
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          kHeight(4.h),
          CustomButton(
            onPress: () {
              /* Navigator.of(context)
                  .pushNamed(PinCodeVerificationScreen.routeName);
*/
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (_) => PinCodeVerificationScreen(
              //       phoneNumber: senderNameC5.value.text,
              //       password: senderNameC6.value.text,
              //       email: senderNameC4.value.text,
              //       fname: senderNameC2.value.text,
              //       lname: senderNameC3.value.text,
              //     ),
              //   ),
              // );
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            width: 88.w,
            height: 7.h,
            title: "Sign up",
          ),
          kHeight(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 2,
                color: colorMediumGrey,
              ),
              kWidth(2.w),
              Text(
                "Or login with",
                style: normalTextStyle,
              ),
              kWidth(2.w),
              Container(width: 30.0.w, height: 2, color: colorMediumGrey),
            ],
          ),
          kHeight(4.h),
          CustomButton(
            onPress: () {},
            width: 88.w,
            height: 7.h,
            buttonColor: colorWhite,
            textColor: colorBlack,
            title: "Google ",
            svgAsset: 'assets/icons/google.svg',
          ),
          kHeight(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account ? ",
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
