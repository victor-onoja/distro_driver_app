import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';

List<Map<String, dynamic>> photoSelectionOption = [
  {
    "icon": "assets/icons/camera.svg",
    "option": "Camera",
  },
  {
    "icon": "assets/icons/gallery.svg",
    "option": "Gallery",
  },
  {
    "icon": "assets/icons/bin.svg",
    "option": "Remove",
  },
];

Future<dynamic> buildChangePhotoModal(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFECFCFB),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppDimensions.height20),
        topRight: Radius.circular(AppDimensions.height20),
      )),
      builder: (context) {
        return Container(
          height: AppDimensions.getProportionateScreenHeight(221),
          padding: EdgeInsets.symmetric(
            vertical: AppDimensions.height24,
            horizontal: AppDimensions.width12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile Photo',
                style: TextStyle(
                  color: colorBlack,
                  fontWeight: FontWeight.w500,
                  fontSize: AppDimensions.height20,
                ),
              ),
              SizedBox(height: AppDimensions.getProportionateScreenHeight(35)),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.getProportionateScreenWidth(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      photoSelectionOption.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            switch (index) {
                              case 0:
                                print('camera option selected');
                              case 1:
                                print('gallery option selected');
                              case 2:
                                print('remove image option selected');
                            }
                          },
                          child: SizedBox(
                            width:
                                AppDimensions.getProportionateScreenWidth(55),
                            height:
                                AppDimensions.getProportionateScreenHeight(90),
                            child: Column(
                              children: [
                                Container(
                                  width: AppDimensions.width20 * 2,
                                  height: AppDimensions.height40,
                                  padding: EdgeInsets.symmetric(
                                    vertical: AppDimensions.height10,
                                    horizontal: AppDimensions.width10,
                                  ),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorPrimary,
                                  ),
                                  child: SvgPicture.asset(
                                      photoSelectionOption[index]["icon"]),
                                ),
                                SizedBox(
                                    height: AppDimensions
                                        .getProportionateScreenHeight(11)),
                                Text(
                                  photoSelectionOption[index]["option"],
                                  style: TextStyle(
                                    color: inActiveIcon,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppDimensions.height16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        );
      });
}
