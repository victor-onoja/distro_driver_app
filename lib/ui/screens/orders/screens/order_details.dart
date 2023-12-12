import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/colors.dart';
import '../widgets/order_delivery_card.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({
    super.key,
    required this.schedule,
    required this.active,
    required this.special,
    required this.history,
    required this.orderId,
    required this.price,
    required this.datetime,
    required this.fromLocation,
    required this.toLocation,
    required this.distance,
    required this.paid,
    required this.details,
    required this.currentPage,
    required this.tabController,
  });

  final String orderId;
  final String price;
  final String datetime;
  final String fromLocation;
  final String toLocation;
  final String distance;
  final bool paid;
  final bool schedule;
  final bool active;
  final bool history;
  final bool details;
  final bool special;
  final ValueNotifier<int> currentPage;
  final TabController tabController;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final bool detailsScreen = true;
  final currentPage = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Order details'),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/icons/simple-line-icons_arrow-up.svg',
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.width16),
          child: Column(
            children: [
              SizedBox(
                height: AppDimensions.height40 - 6,
              ),
              OrderDeliveryCard(
                orderId: widget.orderId,
                price: widget.price,
                datetime: widget.datetime,
                fromLocation: '36 Adeola Adeleye St, Ilupeju,Lagos, ...',
                toLocation: '213 Ikorodu-Ososun Rd, ilupeju, Lag...',
                distance: widget.distance,
                paid: widget.paid,
                schedule: widget.schedule,
                active: widget.active,
                history: widget.history,
                details: widget.details,
                pressed: () {},
                special: widget.special,
                detailsScreen: detailsScreen,
              ),
              SizedBox(
                height: AppDimensions.height56 - 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customer Name',
                    style: headingTextStyle3,
                  ),
                  Text(
                    'David Idowu',
                    style: normalTextStyle4,
                  )
                ],
              ),
              SizedBox(
                height: AppDimensions.height16 * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customer Phone',
                    style: headingTextStyle3,
                  ),
                  Text(
                    ' +2348055663322',
                    style: normalTextStyle4,
                  )
                ],
              ),
              SizedBox(
                height: AppDimensions.height24,
              ),
              widget.special
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDimensions.height14 + 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Special Instruction:',
                              style: normalTextStyleUnderline,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimensions.height10 - 1,
                        ),
                        Text(
                          'Breakable items, be careful when carrying it and when dropping it, it’s  very expensive. Thank you ',
                          style: subHeadingTextStyle,
                        )
                      ],
                    )
                  : Container(),
              SizedBox(
                height: AppDimensions.height40 - 8,
              ),
              widget.history
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(children: [
                              Icon(
                                Icons.star,
                                size: 28,
                                color: colorYellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 28,
                                color: colorYellow,
                              ),
                              Icon(
                                Icons.star,
                                size: 28,
                                color: colorYellow,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 28,
                                color: colorYellow,
                              ),
                              Icon(
                                Icons.star_border,
                                size: 28,
                                color: colorYellow,
                              ),
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: AppDimensions.height12,
                        ),
                        Container(
                          width: 90.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: colorLightGrey)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimensions.height12 / 2,
                                horizontal: AppDimensions.width4 / 2),
                            child: Text(
                              'My Goods got to me in good shape',
                              style: normalTextStyle,
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              onPress: () {},
                              title: 'Call Customer',
                            ),
                            CustomButton(
                              onPress: () {
                                setState(() {
                                  widget.currentPage.value = 2;
                                  widget.tabController.animateTo(0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                });
                                Navigator.pop(context);
                              },
                              title: 'Chat Customer',
                            )
                          ],
                        ),
                        SizedBox(
                          height: AppDimensions.height40 - 10,
                        ),
                        CustomButton(
                          width: 90.w,
                          onPress: () {},
                          title: 'On Map',
                          textColor: colorMediumGrey,
                          buttonColor: colorWhite,
                          buttonBorderColor: colorPrimary,
                        ),
                        SizedBox(
                          height: AppDimensions.height56 + 17,
                        ),
                        widget.active
                            ? CustomButton(
                                width: 90.w,
                                onPress: () {
                                  Navigator.pop(context);
                                },
                                title: 'Picked Up',
                              )
                            : CustomButton(
                                width: 90.w,
                                onPress: () {
                                  Navigator.pop(context);
                                },
                                title: 'Accept Order',
                              )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
