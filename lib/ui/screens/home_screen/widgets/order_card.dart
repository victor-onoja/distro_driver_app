import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_dimensions.dart';
import 'header_text.dart';


class OrderCard extends StatelessWidget {
  const OrderCard(
      {super.key,
      required this.buttonText,
      required this.orderId,
      required this.distance});

  final String buttonText, orderId;
  final double distance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(
                top: AppDimensions.height12,
                right: AppDimensions.width12 / 4,
                left: AppDimensions.width12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.height4),
              border: Border.all(
                width: AppDimensions.getProportionateScreenWidth(1),
                color: colorPrimary,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimensions.width12 / 2,
                            vertical: AppDimensions.height12 / 2),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFAB6F).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(
                                AppDimensions.height10 / 2)),
                        child: SvgPicture.asset('assets/icons/box_icon.svg')),
                    SizedBox(width: AppDimensions.width20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderText(
                          text: orderId,
                          fontSize: AppDimensions.height16,
                        ),
                        SizedBox(height: AppDimensions.height10 + 1),
                        Row(
                          children: [
                            Text(
                              'Distance: ',
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: colorBlackText,
                                  fontSize: AppDimensions.height14,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text('$distance km',
                                style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontStyle: FontStyle.normal,
                                    fontSize: AppDimensions.height14,
                                    fontWeight: FontWeight.w700,
                                    color: colorPrimary)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimensions.height12),
                  child: ElevatedButton(
                    onPressed: () {
                      switch (buttonText) {
                        case 'On Map':
                          print('On Map tapped');
                          //Todo: Complete the code for On Map click
                          break;
                        case 'Accept':
                          print('Accept tapped');
                          //Todo: Complete the code for Accept click
                          break;
                        default:
                          return;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimensions.height4),
                        )),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: AppDimensions.height16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(height: AppDimensions.height10)
      ],
    );
  }
}
