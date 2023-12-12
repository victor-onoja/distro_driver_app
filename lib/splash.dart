import 'package:distro_driver_v2/ui/screens/auths_screen/welcome_page.dart';
import 'package:distro_driver_v2/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnboard;

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

    // Check the user's onboarding status, and based on that, navigate to a different screen.
    _checkOnboardingStatus().then((seenOnboard) {
      // Use a 2-second delay to allow for any necessary asynchronous tasks.
      Future.delayed(const Duration(seconds: 2), () {
        // Check if the user has seen the onboarding screen (seenOnboard == true).
        if (seenOnboard == true) {
          // If the user has seen the onboarding screen, navigate to the WelcomeScreen.
          Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
        } else {
          // If the user has not seen the onboarding screen, navigate to the OnBoardingScreen.
          Navigator.of(context)
              .pushReplacementNamed(OnBoardingScreen.routeName);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  Future<bool> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seenOnboard') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "assets/images/splash.png",
          fit: BoxFit
              .cover, // This will make the image cover the entire container.
        ),
      ),
    );
  }
}
