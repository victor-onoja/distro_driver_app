import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/ui/screens/orders/widgets/notification_circle.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../models/delivery_order_model.dart';
import '../widgets/order_delivery_card.dart';
import 'order_details.dart';

class OrdersScreen extends StatefulWidget {
  final TabController tabController;
  final TabController tabController2;
  final ValueNotifier<int> currentPage;

  OrdersScreen({
    super.key,
    required this.selectedPage,
    required this.tabController,
    required this.currentPage,
    required this.tabController2,
  });

  int selectedPage;

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // to toggle between express and schedule states
  bool newschedule = false;
  bool activeschedule = false;
  bool historyschedule = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                  controller: widget.tabController,
                  labelColor: colorPrimary,
                  unselectedLabelColor: colorMediumGrey,
                  labelStyle: normalTextStyle2,
                  indicatorColor: colorPrimary,
                  tabs: [
                    // notification for new tab
                    Tab(
                      child: Stack(children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: AppDimensions.width10,
                            ),
                            const Text(
                              'New',
                            ),
                          ],
                        ),
                        Positioned(
                          top: 0,
                          left: 5,
                          child: Container(
                            width:
                                10, // Adjust the size of the circle as needed
                            height: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: colorSecondary,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    // no notification
                    // const Tab(
                    //   child: Text(
                    //     'New',
                    //   ),
                    // ),
                    const Tab(
                      child: Text(
                        'Active',
                      ),
                    ),
                    const Tab(
                      child: Text(
                        'History',
                      ),
                    ),
                  ])
            ],
          ),
        ),
        body: TabBarView(controller: widget.tabController, children: [
          // new

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.width16),
              child: Column(
                children: [
                  // express & schedule button

                  Padding(
                    padding: EdgeInsets.only(
                        top: AppDimensions.height16,
                        bottom: AppDimensions.height40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(right: AppDimensions.width4),
                          child: newschedule
                              ? Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    textColor: colorMediumGrey,
                                    buttonColor: colorWhite,
                                    buttonBorderColor: colorLightGrey,
                                    onPress: () {
                                      setState(() {
                                        newschedule = false;
                                      });
                                    },
                                    title: 'Express',
                                  ),
                                  NotificationCircle(
                                      schedule: false,
                                      color: colorNewNotification,
                                      text: newExpressOrders.length.toString())
                                ])
                              : Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    onPress: () {
                                      setState(() {
                                        newschedule = false;
                                      });
                                    },
                                    title: 'Express',
                                  ),
                                  NotificationCircle(
                                      schedule: false,
                                      color: colorNewNotification,
                                      text: newExpressOrders.length.toString())
                                ]),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: AppDimensions.width4),
                          child: newschedule
                              ? Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    onPress: () {
                                      setState(() {
                                        newschedule = true;
                                      });
                                    },
                                    title: 'Schedule',
                                  ),
                                  NotificationCircle(
                                      schedule: true,
                                      color: colorNewNotification,
                                      text:
                                          newScheduleOrders.length.toString()),
                                ])
                              : Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    textColor: colorMediumGrey,
                                    buttonColor: colorWhite,
                                    buttonBorderColor: colorLightGrey,
                                    onPress: () {
                                      setState(() {
                                        newschedule = true;
                                      });
                                    },
                                    title: 'Schedule',
                                  ),
                                  NotificationCircle(
                                      schedule: true,
                                      color: colorNewNotification,
                                      text: newScheduleOrders.length.toString())
                                ]),
                        ))
                      ],
                    ),
                  ),

                  // order card
                  newschedule
                      ? SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: newScheduleOrders.length,
                              itemBuilder: (context, index) {
                                DeliveryOrderModel order =
                                    newScheduleOrders[index];
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OrderDetails(
                                              schedule: order.schedule,
                                              active: order.active,
                                              special: order.special,
                                              history: order.history,
                                              datetime: order.datetime,
                                              details: order.details,
                                              distance: order.distance,
                                              fromLocation: order.fromLocation,
                                              orderId: order.orderId,
                                              paid: order.paid,
                                              price: order.price,
                                              toLocation: order.toLocation,
                                              currentPage: widget.currentPage,
                                              tabController:
                                                  widget.tabController2,
                                            ),
                                          ),
                                        );
                                      },
                                      child: OrderDeliveryCard(
                                          orderId: order.orderId,
                                          price: order.price,
                                          datetime: order.datetime,
                                          fromLocation: order.fromLocation,
                                          toLocation: order.toLocation,
                                          distance: order.distance,
                                          paid: order.paid,
                                          schedule: order.schedule,
                                          active: order.active,
                                          history: order.history,
                                          details: order.details,
                                          pressed: () {},
                                          special: order.special,
                                          detailsScreen: false),
                                    ),
                                    SizedBox(
                                      height: AppDimensions.height16,
                                    ),
                                  ],
                                );
                              }))
                      : SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: newExpressOrders.length,
                              itemBuilder: (context, index) {
                                DeliveryOrderModel order =
                                    newExpressOrders[index];
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OrderDetails(
                                              schedule: order.schedule,
                                              active: order.active,
                                              special: order.special,
                                              history: order.history,
                                              datetime: order.datetime,
                                              details: order.details,
                                              distance: order.distance,
                                              fromLocation: order.fromLocation,
                                              orderId: order.orderId,
                                              paid: order.paid,
                                              price: order.price,
                                              toLocation: order.toLocation,
                                              currentPage: widget.currentPage,
                                              tabController:
                                                  widget.tabController2,
                                            ),
                                          ),
                                        );
                                      },
                                      child: OrderDeliveryCard(
                                          orderId: order.orderId,
                                          price: order.price,
                                          datetime: order.datetime,
                                          fromLocation: order.fromLocation,
                                          toLocation: order.toLocation,
                                          distance: order.distance,
                                          paid: order.paid,
                                          schedule: order.schedule,
                                          active: order.active,
                                          history: order.history,
                                          details: order.details,
                                          pressed: () {},
                                          special: order.special,
                                          detailsScreen: false),
                                    ),
                                    SizedBox(
                                      height: AppDimensions.height16,
                                    ),
                                  ],
                                );
                              }))
                ],
              ),
            ),
          ),

          // active

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.width16),
              child: Column(
                children: [
                  // express & schedule button

                  Padding(
                    padding: EdgeInsets.only(
                        top: AppDimensions.height16,
                        bottom: AppDimensions.height40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(right: AppDimensions.width4),
                          child: activeschedule
                              ? Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    textColor: colorMediumGrey,
                                    buttonColor: colorWhite,
                                    buttonBorderColor: colorLightGrey,
                                    onPress: () {
                                      setState(() {
                                        activeschedule = false;
                                      });
                                    },
                                    title: 'Express',
                                  ),
                                  NotificationCircle(
                                      schedule: false,
                                      color: colorSecondaryNotification,
                                      text:
                                          activeExpressOrders.length.toString())
                                ])
                              : Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    onPress: () {
                                      setState(() {
                                        activeschedule = false;
                                      });
                                    },
                                    title: 'Express',
                                  ),
                                  NotificationCircle(
                                      schedule: false,
                                      color: colorSecondaryNotification,
                                      text:
                                          activeExpressOrders.length.toString())
                                ]),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: AppDimensions.width4),
                          child: activeschedule
                              ? Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    onPress: () {
                                      setState(() {
                                        activeschedule = true;
                                      });
                                    },
                                    title: 'Schedule',
                                  ),
                                  NotificationCircle(
                                      schedule: true,
                                      color: colorSecondaryNotification,
                                      text: activeScheduleOrders.length
                                          .toString())
                                ])
                              : Stack(children: [
                                  CustomButton(
                                    height: 6.h,
                                    textColor: colorMediumGrey,
                                    buttonColor: colorWhite,
                                    buttonBorderColor: colorLightGrey,
                                    onPress: () {
                                      setState(() {
                                        activeschedule = true;
                                      });
                                    },
                                    title: 'Schedule',
                                  ),
                                  NotificationCircle(
                                      schedule: true,
                                      color: colorSecondaryNotification,
                                      text: activeScheduleOrders.length
                                          .toString())
                                ]),
                        ))
                      ],
                    ),
                  ),

                  // order card

                  activeschedule
                      ? SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: activeScheduleOrders.length,
                              itemBuilder: (context, index) {
                                DeliveryOrderModel order =
                                    activeScheduleOrders[index];
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OrderDetails(
                                              schedule: order.schedule,
                                              active: order.active,
                                              special: order.special,
                                              history: order.history,
                                              datetime: order.datetime,
                                              details: order.details,
                                              distance: order.distance,
                                              fromLocation: order.fromLocation,
                                              orderId: order.orderId,
                                              paid: order.paid,
                                              price: order.price,
                                              toLocation: order.toLocation,
                                              currentPage: widget.currentPage,
                                              tabController:
                                                  widget.tabController2,
                                            ),
                                          ),
                                        );
                                      },
                                      child: OrderDeliveryCard(
                                        orderId: order.orderId,
                                        price: order.price,
                                        datetime: order.datetime,
                                        fromLocation: order.fromLocation,
                                        toLocation: order.toLocation,
                                        distance: order.distance,
                                        paid: order.paid,
                                        schedule: order.schedule,
                                        active: order.active,
                                        history: order.history,
                                        details: order.details,
                                        pressed: () {},
                                        special: order.special,
                                        detailsScreen: false,
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimensions.height16,
                                    ),
                                  ],
                                );
                              }))
                      : SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: activeExpressOrders.length,
                              itemBuilder: (context, index) {
                                DeliveryOrderModel order =
                                    activeExpressOrders[index];
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => OrderDetails(
                                              schedule: order.schedule,
                                              active: order.active,
                                              special: order.special,
                                              history: order.history,
                                              datetime: order.datetime,
                                              details: order.details,
                                              distance: order.distance,
                                              fromLocation: order.fromLocation,
                                              orderId: order.orderId,
                                              paid: order.paid,
                                              price: order.price,
                                              toLocation: order.toLocation,
                                              currentPage: widget.currentPage,
                                              tabController:
                                                  widget.tabController2,
                                            ),
                                          ),
                                        );
                                      },
                                      child: OrderDeliveryCard(
                                        orderId: order.orderId,
                                        price: order.price,
                                        datetime: order.datetime,
                                        fromLocation: order.fromLocation,
                                        toLocation: order.toLocation,
                                        distance: order.distance,
                                        paid: order.paid,
                                        schedule: order.schedule,
                                        active: order.active,
                                        history: order.history,
                                        details: order.details,
                                        pressed: () {},
                                        special: order.special,
                                        detailsScreen: false,
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimensions.height16,
                                    ),
                                  ],
                                );
                              }))
                ],
              ),
            ),
          ),

          // history

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.width16),
              child: Column(
                children: [
                  // express & schedule button

                  Padding(
                    padding: EdgeInsets.only(
                        top: AppDimensions.height16,
                        bottom: AppDimensions.height40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(right: AppDimensions.width4),
                          child: historyschedule
                              ? CustomButton(
                                  height: 6.h,
                                  textColor: colorMediumGrey,
                                  buttonColor: colorWhite,
                                  buttonBorderColor: colorLightGrey,
                                  onPress: () {
                                    setState(() {
                                      historyschedule = false;
                                    });
                                  },
                                  title: 'Express',
                                )
                              : CustomButton(
                                  height: 6.h,
                                  onPress: () {
                                    setState(() {
                                      historyschedule = false;
                                    });
                                  },
                                  title: 'Express',
                                ),
                        )),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: AppDimensions.width4),
                          child: historyschedule
                              ? CustomButton(
                                  height: 6.h,
                                  onPress: () {
                                    setState(() {
                                      historyschedule = true;
                                    });
                                  },
                                  title: 'Schedule',
                                )
                              : CustomButton(
                                  height: 6.h,
                                  textColor: colorMediumGrey,
                                  buttonColor: colorWhite,
                                  buttonBorderColor: colorLightGrey,
                                  onPress: () {
                                    setState(() {
                                      historyschedule = true;
                                    });
                                  },
                                  title: 'Schedule',
                                ),
                        ))
                      ],
                    ),
                  ),

                  //  order card

                  historyschedule
                      ? SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: historyScheduleOrders.length,
                              itemBuilder: (context, index) {
                                DeliveryOrderModel order =
                                    historyScheduleOrders[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderDetails(
                                          schedule: order.schedule,
                                          active: order.active,
                                          special: order.special,
                                          history: order.history,
                                          datetime: order.datetime,
                                          details: order.details,
                                          distance: order.distance,
                                          fromLocation: order.fromLocation,
                                          orderId: order.orderId,
                                          paid: order.paid,
                                          price: order.price,
                                          toLocation: order.toLocation,
                                          currentPage: widget.currentPage,
                                          tabController: widget.tabController2,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      OrderDeliveryCard(
                                          orderId: order.orderId,
                                          price: order.price,
                                          datetime: order.datetime,
                                          fromLocation: order.fromLocation,
                                          toLocation: order.toLocation,
                                          distance: order.distance,
                                          paid: order.paid,
                                          schedule: order.schedule,
                                          active: order.active,
                                          history: order.history,
                                          details: order.details,
                                          pressed: () {},
                                          special: order.special,
                                          detailsScreen: false),
                                      SizedBox(
                                        height: AppDimensions.height16,
                                      ),
                                    ],
                                  ),
                                );
                              }))
                      : SingleChildScrollView(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: historyExpressOrders.length,
                              itemBuilder: (context, index) {
                                DeliveryOrderModel order =
                                    historyExpressOrders[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderDetails(
                                          schedule: order.schedule,
                                          active: order.active,
                                          special: order.special,
                                          history: order.history,
                                          datetime: order.datetime,
                                          details: order.details,
                                          distance: order.distance,
                                          fromLocation: order.fromLocation,
                                          orderId: order.orderId,
                                          paid: order.paid,
                                          price: order.price,
                                          toLocation: order.toLocation,
                                          currentPage: widget.currentPage,
                                          tabController: widget.tabController2,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      OrderDeliveryCard(
                                          orderId: order.orderId,
                                          price: order.price,
                                          datetime: order.datetime,
                                          fromLocation: order.fromLocation,
                                          toLocation: order.toLocation,
                                          distance: order.distance,
                                          paid: order.paid,
                                          schedule: order.schedule,
                                          active: order.active,
                                          history: order.history,
                                          details: order.details,
                                          pressed: () {},
                                          special: order.special,
                                          detailsScreen: false),
                                      SizedBox(
                                        height: AppDimensions.height16,
                                      ),
                                    ],
                                  ),
                                );
                              }))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
