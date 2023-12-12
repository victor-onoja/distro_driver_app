import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';


Future<dynamic> buildChatTitlePrompt(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor:
      colorBlackText.withOpacity(0.4), //Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          color: colorBlackText.withOpacity(0.4),
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.width20),
          height: AppDimensions.screenHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: AppDimensions.getProportionateScreenHeight(45),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppDimensions.width16,
                      vertical: AppDimensions.height10),
                  decoration: BoxDecoration(
                      color: colorLightGrey,
                      borderRadius:
                      BorderRadius.circular(AppDimensions.height4),
                      border: Border.all(width: 1, color: colorLightGrey)),
                  child: ClipRRect(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: AppDimensions.height4,
                            left: AppDimensions.width10),
                        hintText: 'Enter chat topic',
                        hintStyle: subHeadingTextStyle.copyWith(
                            fontSize: 15.px, fontWeight: FontWeight.w400),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height4),
                            borderSide: BorderSide(
                                width: 1, color: colorLightGrey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height4),
                            borderSide: BorderSide(
                                width: 1, color: colorLightGrey)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppDimensions.height20 * 2),
                Container(
                    width: double.infinity,
                    height: AppDimensions.getProportionateScreenHeight(45),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.width12),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Start a new chat',
                          style:
                          textButtonStyle.copyWith(color: Colors.white),
                        ))),
              ],
            ),
          ),
        );
      });
}