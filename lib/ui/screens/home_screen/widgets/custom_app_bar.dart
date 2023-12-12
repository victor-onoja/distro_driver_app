import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/ui/screens/personal_info_screen/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/app_dimensions.dart';

AppBar buildCustomAppBar() {
  return AppBar(
    elevation: 0.3,
    systemOverlayStyle: const SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Colors.white,

      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    leading: Builder(
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Padding(
            padding: EdgeInsets.only(left: AppDimensions.width16, bottom: 7.px),
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
              height: AppDimensions.height24,
            ),
          ),
        );
      },
    ),
    actions: [
      GestureDetector(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(10.px),
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 2,
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(1, 1))
                  ]),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: AppDimensions.height24,
                child: Icon(
                  Icons.notifications,
                  color: colorPrimary,
                  size: AppDimensions.getProportionateScreenHeight(30),
                ),
              ),
            ),
            Positioned(
              top: AppDimensions.height2 * 2,
              left: AppDimensions.height16 / 1.5,
              child: Container(
                height: AppDimensions.height14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(
                        width: AppDimensions.height2 + 0.5,
                        color: Colors.white)),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(' '),
                ),
              ),
            )
          ]),
        ),
      ),
      Builder(builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(PersonalInfoScreen.routeName);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 7.px,
              horizontal: 16.px,
            ),
            margin: EdgeInsets.only(right: 16.px),
            height: AppDimensions.height20 * 2,
            width: AppDimensions.width20 * 2,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/profile_image.png',
                ),
              ),
            ),
          ),
        );
      })
    ],
  );
}

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: AppDimensions.height56,
//       padding: EdgeInsets.only(
//           right: AppDimensions.width24 - 2,
//           left: AppDimensions.width16,
//           top: AppDimensions.height10,
//           bottom: AppDimensions.height10),
//       // color: Colors.red,
//       decoration: BoxDecoration(color: Colors.white, boxShadow: [
//         BoxShadow(
//             blurRadius: 2,
//             spreadRadius: 2,
//             color: Colors.grey.withOpacity(0.1),
//             offset: Offset(1, 1),
//             blurStyle: BlurStyle.outer)
//       ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () {},
//             child: SvgPicture.asset(
//               'assets/icons/menu.svg',
//               height: AppDimensions.height24,
//             ),
//           ),
//           Row(
//             children: [
//               Stack(children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                             spreadRadius: 2,
//                             blurRadius: 2,
//                             color: Colors.grey.withOpacity(0.2),
//                             offset: Offset(1, 1))
//                       ]),
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: AppDimensions.height24,
//                     child: Icon(
//                       Icons.notifications,
//                       color: colorPrimary,
//                       size: AppDimensions.getProportionateScreenHeight(26),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: AppDimensions.height2,
//                   left: AppDimensions.height16 / 2,
//                   child: Container(
//                     height: AppDimensions.height14,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.red,
//                         border: Border.all(
//                             width: AppDimensions.height2 + 0.5,
//                             color: Colors.white)),
//                     child: CircleAvatar(
//                       backgroundColor: Colors.red,
//                       child: Text(''),
//                     ),
//                   ),
//                 )
//               ]),
//               SizedBox(width: AppDimensions.width12 / 2),
//               Container(
//                 height: AppDimensions.height20 * 2,
//                 decoration: const BoxDecoration(
//                   color: Colors.red,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Image.asset('assets/images/profile_image.png'),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
