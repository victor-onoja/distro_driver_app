import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/ui/screens/home_screen/widgets/search_order.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../models/order_model.dart';

import 'header_text.dart';
import 'order_card.dart';

class MyHomeScreen extends StatefulWidget {
  final TabController tabController;
  final ValueNotifier<int> currentPage;
  const MyHomeScreen(
      {super.key, required this.tabController, required this.currentPage});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    String userName = 'John';

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimensions.height10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.width16),
            child: Text(
              'Good morning, $userName',
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w500,
                  fontSize: AppDimensions.height14,
                  fontStyle: FontStyle.normal,
                  color: colorMediumGrey),
            ),
          ),
          SizedBox(height: AppDimensions.height2 * 2),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimensions.width16),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(text: 'Check for available orders'),
                    SizedBox(height: AppDimensions.height20 + 1),
                    const SearchOrder(),
                    SizedBox(height: AppDimensions.height14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HeaderText(text: 'Active Delivery'),
                        newDelivery.length > 4
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.currentPage.value = 1;
                                    widget.tabController.animateTo(1,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  });
                                },
                                child: const Text('show more'))
                            : Container()
                      ],
                    ),
                    SizedBox(height: AppDimensions.height16),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: activeDelivery.length > 4
                            ? 4
                            : activeDelivery.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                              orderId: activeDelivery[index]['orderId'],
                              distance: activeDelivery[index]['distance'],
                              buttonText: 'On Map');
                        }),
                    SizedBox(height: AppDimensions.height14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HeaderText(text: 'New Delivery'),
                        newDelivery.length > 4
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.currentPage.value = 1;

                                    widget.tabController.animateTo(0,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn);
                                  });
                                },
                                child: const Text('show more'))
                            : Container()
                      ],
                    ),
                    SizedBox(height: AppDimensions.height16),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            newDelivery.length > 4 ? 4 : newDelivery.length,
                        itemBuilder: (context, index) {
                          return OrderCard(
                              orderId: newDelivery[index]['orderId'],
                              distance: newDelivery[index]['distance'],
                              buttonText: 'Accept');
                        }),
                    SizedBox(height: AppDimensions.height20)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.currentPage.addListener(() {});
  }
}
