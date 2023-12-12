import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_dimensions.dart';

class SearchOrder extends StatelessWidget {
  const SearchOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: AppDimensions.getProportionateScreenHeight(40),
          width: AppDimensions.getProportionateScreenWidth(282),
          decoration: BoxDecoration(
              color: colorLightGrey,
              borderRadius: BorderRadius.circular(AppDimensions.height4)),
          //padding: EdgeInsets.only(top: AppDimensions.height10),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            onFieldSubmitted: (value) {},
            onChanged: (value) {},
            style: TextStyle(
                fontFamily: 'Lato',
                fontSize: AppDimensions.height14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: AppDimensions.height10),
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: AppDimensions.height10),
                  child: SvgPicture.asset(
                    'assets/icons/lens.svg',
                  ),
                ),
                hintText: 'Enter tracking number',
                hintStyle: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: AppDimensions.getProportionateScreenHeight(13),
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: colorMediumGrey),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder()),
          ),
        ),
        Container(
          width: AppDimensions.width20 * 1.8,
          height: AppDimensions.height20 * 2,
          decoration: BoxDecoration(
              color: colorLightGrey,
              borderRadius: BorderRadius.circular(AppDimensions.height4)),
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.width12,
                  vertical: AppDimensions.height12),
              child: SvgPicture.asset('assets/icons/track.svg'),
            ),
          ),
        )
      ],
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppDimensions.height4),
    borderSide: const BorderSide(width: 0.1, color: colorLightGrey),
  );
}
