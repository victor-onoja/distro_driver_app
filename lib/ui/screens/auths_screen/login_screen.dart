import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/forgot_password_screen.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/registeration_screen.dart';
import 'package:distro_driver_v2/ui/screens/home_screen/home_screen.dart';
import 'package:distro_driver_v2/ui/widgets/bordered_textfield.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final senderNameC2 = TextEditingController();
    final senderNameC3 = TextEditingController();

    var isPasswordVisible = false; // Initialize as false to hide the password
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: headingTextStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          kHeight(8.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: senderNameC2,
              hintText: "Username ",
              // obscureText: true,
            ),
          ),
          kHeight(4.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BorderedTextField(
              controller: senderNameC3,
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
          kHeight(2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordScreen.routeName);
                    },
                    child: Text(
                      "Forget Password?",
                      style: normalPrimaryStyle,
                    ))
              ],
            ),
          ),
          kHeight(10.h),
          CustomButton(
            onPress: () {
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            },
            title: "Login",
            width: 88.w,
            height: 7.h,
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
            onPress: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
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
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  },
                  child: Text(
                    "Sign up",
                    style: normalPrimaryStyle,
                  ))
            ],
          )
        ],
      )),
    );
  }
}
