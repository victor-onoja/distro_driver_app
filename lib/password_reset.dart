import 'package:distro_driver_v2/core/constants/screen_utils.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/login_screen.dart';
import 'package:distro_driver_v2/ui/widgets/bordered_textfield.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PasswordResetScreen extends StatelessWidget {
  static const String routeName = '/password_reset_screen';
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordReset1 = TextEditingController();
    final passwordReset2 = TextEditingController();

    var isPasswordVisible = false; // Initialize as false to hide the password
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change New Password",
          style: headingTextStyle,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                    controller: passwordReset1,
                    hintText: "New Password ",
                    // obscureText: true,
                    obscureText:
                        !isPasswordVisible, // Toggle password visibility
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // Toggle password visibility when the icon is tapped
                        isPasswordVisible = !isPasswordVisible;
                      },
                      child: Icon(
                        isPasswordVisible
                            // ignore: dead_code
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                kHeight(2.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BorderedTextField(
                    controller: passwordReset2,
                    hintText: "Confirm Password ",
                    // obscureText: true,
                    obscureText:
                        !isPasswordVisible, // Toggle password visibility
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // Toggle password visibility when the icon is tapped
                        isPasswordVisible = !isPasswordVisible;
                      },
                      child: Icon(
                        isPasswordVisible
                            // ignore: dead_code
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  onPress: () {},
                  title: "Reset Password",
                  width: 88.w,
                  height: 7.h,
                ),
                kHeight(1.h),
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
                          Navigator.of(context)
                              .pushNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          "Sign in",
                          style: normalPrimaryStyle,
                        ))
                  ],
                )
              ],
            ),
            kHeight(1.h),
          ],
        ),
      ),
    );
  }
}
