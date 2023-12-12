import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({super.key, required this.userImg, required this.message});

  final String userImg, message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            const Text(''),
            Container(
              constraints: BoxConstraints(
                  maxWidth: AppDimensions.getProportionateScreenWidth(250)),
              padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.height10 * 0.7,
                  horizontal: AppDimensions.width10 * 0.5),
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  borderRadius:
                      BorderRadius.circular(AppDimensions.height4 * 2)),
              child: Text(
                message,
                style: TextStyle(
                  color: colorBlackText,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ],
        ),
        Container(
          height: AppDimensions.getProportionateScreenHeight(50),
          width: AppDimensions.getProportionateScreenWidth(50),
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.width12),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(userImg)),
            border: Border.all(width: 1.px, color: colorMediumGrey),
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
