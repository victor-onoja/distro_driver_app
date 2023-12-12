import 'package:flutter/cupertino.dart';

class AppDimensions {
  static late double screenWidth;
  static late double screenHeight;
  static late MediaQueryData mediaQueryData;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
  }

  ///App Heights
  static final double height2 = screenHeight / 912 * 2;
  static final double height4 = screenHeight / 912 * 4;
  static final double height10 = screenHeight / 912 * 10;
  static final double height12 = screenHeight / 912 * 12;
  static final double height14 = screenHeight / 912 * 14;
  static final double height16 = screenHeight / 912 * 16;
  static final double height20 = screenHeight / 912 * 20;
  static final double height24 = screenHeight / 912 * 24;
  static final double height40 = screenHeight / 912 * 40;
  static final double height56 = screenHeight / 912 * 56;

  ///App Widths
  static final double width4 = screenWidth / 360 * 4;
  static final double width10 = screenWidth / 360 * 10;
  static final double width12 = screenWidth / 360 * 12;
  static final double width16 = screenWidth / 360 * 16;
  static final double width20 = screenWidth / 360 * 20;
  static final double width22 = screenWidth / 360 * 22;
  static final double width24 = screenWidth / 360 * 24;

  ///Custom Sizes
  static double getProportionateScreenHeight(inputHeight) {
    return screenHeight / 912 * inputHeight;
  }

  static double getProportionateScreenWidth(inputWidth) {
    return screenWidth / 360 * inputWidth;
  }
}
