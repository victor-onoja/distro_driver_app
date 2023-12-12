import 'package:distro_driver_v2/splash.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/forgot_password_screen.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/login_screen.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/registeration_screen.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/welcome_page.dart';
import 'package:distro_driver_v2/ui/screens/home_screen/home_screen.dart';
import 'package:distro_driver_v2/ui/screens/language/language_screen.dart';
import 'package:distro_driver_v2/ui/screens/onboarding/onboarding_screen.dart';
import 'package:distro_driver_v2/ui/screens/personal_info_screen/personal_info_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case MainScreen.routeName:
      //   // final param = settings.arguments as String;
      //   return MaterialPageRoute(builder: (_) => const MainScreen());

      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case OnBoardingScreen.routeName:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      // Home Screen
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        });

      //Profile section
      case PersonalInfoScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return const PersonalInfoScreen();
        });
      case LanguageScreen.routeName:
        return MaterialPageRoute(builder: (context) {
          return const LanguageScreen();
        });

      // case ChatRoom.routeName:
      //   return MaterialPageRoute(builder: (context) {
      //     return ChatRoom();
      //   });

      // new section
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
