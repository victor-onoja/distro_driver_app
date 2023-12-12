import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/routes.dart';
import 'package:distro_driver_v2/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initializing and creating hive persistence storage

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Distro Driver',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: colorPrimary),
            // colorScheme: ColorScheme.fromSwatch( primarySwatch: colo),
            // useMaterial3: true,
            iconTheme: const IconThemeData(
              color: colorPrimary,
            ),
            appBarTheme: AppBarTheme(
                // color: Colors.black,
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.px,
                    fontWeight: FontWeight.w500),
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ))),
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        // home: PasswordResetScreen(),
      );
    });
  }
}
