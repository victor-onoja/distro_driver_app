import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../home_screen/widgets/header_text.dart';

class OrderDeliveryCard extends StatelessWidget {
  const OrderDeliveryCard({
    super.key,
    required this.orderId,
    required this.price,
    required this.datetime,
    required this.fromLocation,
    required this.toLocation,
    required this.distance,
    required this.paid,
    required this.schedule,
    required this.active,
    required this.history,
    required this.details,
    required this.pressed,
    required this.special,
    required this.detailsScreen,
  });

  final String orderId, price, datetime, fromLocation, toLocation, distance;
  final bool paid, schedule, active, history, details, special, detailsScreen;
  final void Function() pressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.px),
          border: history
              ? Border.all(color: colorPrimary)
              : Border.all(color: colorLightGrey)),
      child: Padding(
        padding: EdgeInsets.only(
            top: AppDimensions.height16,
            bottom: AppDimensions.height16 / 2,
            left: AppDimensions.width12,
            right: AppDimensions.width12 / 4),
        child: Column(
          children: [
            // row 1

            Row(
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
                        schedule
                            ? Row(
                                children: [
                                  Text(
                                    'Schedule: ',
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: colorBlackText,
                                        fontSize: AppDimensions.height14,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    datetime,
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontStyle: FontStyle.normal,
                                        fontSize: AppDimensions.height14,
                                        fontWeight: FontWeight.w700,
                                        color: colorPrimary),
                                  ),
                                ],
                              )
                            : Text(
                                datetime,
                                style: silverTextStyle,
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
                            Text(distance,
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
                history
                    ? Column(
                        children: [
                          HeaderText(
                            text: price,
                            fontSize: AppDimensions.height16,
                          ),
                          SizedBox(height: AppDimensions.height10 + 1),
                          paid
                              ? Container(
                                  color:
                                      const Color(0xFF00a69c).withOpacity(0.2),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppDimensions.height4,
                                        horizontal: AppDimensions.width12 / 4),
                                    child: Text(
                                      'Paid',
                                      style: paidTextStyle,
                                    ),
                                  ),
                                )
                              : Container(
                                  color:
                                      const Color(0xFFFFE600).withOpacity(0.2),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppDimensions.height4,
                                        horizontal: AppDimensions.width12 / 4),
                                    child: Text(
                                      'Pay on Delivery',
                                      style: deliveryTextStyle,
                                    ),
                                  ),
                                ),
                          SizedBox(height: AppDimensions.height10),
                          details
                              ? Container()
                              : const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: colorYellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: colorYellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 18,
                                      color: colorYellow,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      size: 18,
                                      color: colorYellow,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      size: 18,
                                      color: colorYellow,
                                    ),
                                  ],
                                )
                        ],
                      )
                    : Column(
                        children: [
                          HeaderText(
                            text: price,
                            fontSize: AppDimensions.height16,
                          ),
                          SizedBox(height: AppDimensions.height10 + 1),
                          paid
                              ? Container(
                                  color:
                                      const Color(0xFF00a69c).withOpacity(0.2),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppDimensions.height4,
                                        horizontal: AppDimensions.width12 / 4),
                                    child: Text(
                                      'Paid',
                                      style: paidTextStyle,
                                    ),
                                  ),
                                )
                              : Container(
                                  color:
                                      const Color(0xFFFFE600).withOpacity(0.2),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: AppDimensions.height4,
                                        horizontal: AppDimensions.width12 / 4),
                                    child: Text(
                                      'Pay on Delivery',
                                      style: deliveryTextStyle,
                                    ),
                                  ),
                                )
                        ],
                      )
              ],
            ),
            SizedBox(height: AppDimensions.height4),
            // row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/delivery_icon.svg'),
                    SizedBox(width: AppDimensions.width24 + 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From',
                          style: silverTextStyle,
                        ),
                        HeaderText(
                          text: fromLocation,
                          fontSize: AppDimensions.height16,
                        ),
                        SizedBox(height: AppDimensions.height20),
                        Text(
                          'To',
                          style: silverTextStyle,
                        ),
                        HeaderText(
                          text: toLocation,
                          fontSize: AppDimensions.height16,
                        ),
                      ],
                    )
                  ],
                ),
                history
                    ? Container()
                    : detailsScreen
                        ? Container()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: AppDimensions.height4 * 2),
                                child: CustomButton(
                                  height: 4.5.h,
                                  width: 30.w,
                                  onPress: pressed,
                                  title: active ? 'Picked Up' : 'Accept',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: AppDimensions.height4 * 2),
                                child: CustomButton(
                                  height: 4.5.h,
                                  width: 30.w,
                                  onPress: () {},
                                  title: 'On Map',
                                ),
                              )
                            ],
                          )
              ],
            ),
            // could still be useful for displaying special items

            // special
            //     ? Row(
            //         children: [
            //           SizedBox(
            //             width: AppDimensions.width24 + 20,
            //           ),
            //           Flexible(
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 SizedBox(
            //                   height: AppDimensions.height14 + 1,
            //                 ),
            //                 Text(
            //                   'Special Instruction:',
            //                   style: normalTextStyleUnderline,
            //                 ),
            //                 Text(
            //                   'Breakable items, be careful when carrying it and when dropping it, it’s  very expensive. Thank you ',
            //                   style: subHeadingTextStyle,
            //                 )
            //               ],
            //             ),
            //           )
            //         ],
            //       )
            //     : Container()
          ],
        ),
      ),
    );
  }
}
