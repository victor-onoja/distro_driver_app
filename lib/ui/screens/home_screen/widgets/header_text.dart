import 'package:distro_driver_v2/core/constants/app_dimensions.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.text,
    this.fontSize,
  });

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: headingTextStyle.copyWith(
          fontSize: AppDimensions.getProportionateScreenHeight(17)),
    );
  }
}
