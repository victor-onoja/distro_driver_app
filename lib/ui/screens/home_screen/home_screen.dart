import 'dart:collection';

import 'package:distro_driver_v2/ui/screens/app_drawer/app_drawer.dart';
import 'package:distro_driver_v2/ui/screens/chat_screen/chat_screen.dart';
import 'package:distro_driver_v2/ui/screens/home_screen/widgets/custom_app_bar.dart';
import 'package:distro_driver_v2/ui/screens/home_screen/widgets/my_home_page.dart';
import 'package:distro_driver_v2/ui/screens/orders/screens/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_dimensions.dart';
import '../chat_screen/widgets/chat_appbar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final currentPage = ValueNotifier<int>(0);

  final ListQueue<int> _navigationQueue = ListQueue();
  late final TabController tabController;
  late final TabController tabController2;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
    tabController2 = TabController(length: 2, vsync: this);

    pages = [
      MyHomeScreen(
        tabController: tabController,
        currentPage: currentPage,
      ),
      OrdersScreen(
        selectedPage: 0,
        tabController: tabController,
        currentPage: currentPage,
        tabController2: tabController2,
      ),
      ChatScreen(
        tabController: tabController2,
      ),
    ];

    currentPage.addListener(() {
      if (currentPage.value == 0) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    AppDimensions().init(context);
    return WillPopScope(
      onWillPop: () async {
        if (_navigationQueue.isEmpty) {
          if (currentPage.value == 0) return true;
        }

        setState(() {
          currentPage.value = 0;
          _navigationQueue.removeLast();
          _navigationQueue.clear();
        });

        return false;
      },
      child: Scaffold(
        appBar: currentPage.value < 2
            ? buildCustomAppBar()
            : buildChatScreenAppBar(context),
        drawer: AppDrawer(
          tabController: tabController,
          currentPage: currentPage,
          tabController2: tabController2,
        ),
        body: ValueListenableBuilder(
          valueListenable: currentPage,
          builder: (context, currentPage, Widget? child) {
            return IndexedStack(
              index: currentPage,
              children: pages,
            );
          },
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: currentPage,
          builder: (context, currentPageValue, Widget? child) {
            return BottomNavigationBar(
              currentIndex: currentPageValue,
              onTap: (value) {
                _navigationQueue.addLast(currentPageValue);
                currentPage.value = value; // Update the ValueNotifier directly
              },
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentPageValue == 0
                        ? 'assets/icons/home_icon_fill.svg'
                        : 'assets/icons/home_icon.svg',
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentPageValue == 1
                        ? 'assets/icons/order_driver_icon_fill.svg'
                        : 'assets/icons/order_driver_icon.svg',
                  ),
                  label: 'Order',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    currentPageValue == 2
                        ? 'assets/icons/chat_icon_fill.svg'
                        : 'assets/icons/chat_icon.svg',
                  ),
                  label: 'Chat',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
