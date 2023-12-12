import 'package:distro_driver_v2/core/constants/colors.dart';
import 'package:distro_driver_v2/core/constants/text_styles.dart';
import 'package:distro_driver_v2/splash.dart';
import 'package:distro_driver_v2/ui/screens/auths_screen/welcome_page.dart';
import 'package:distro_driver_v2/ui/screens/onboarding/intro_page_1.dart';
import 'package:distro_driver_v2/ui/screens/onboarding/intro_page_2.dart';
import 'package:distro_driver_v2/ui/screens/onboarding/intro_page_3.dart';
import 'package:distro_driver_v2/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding_screen';
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  // keep track if we are on the last page
  bool onLastPage = true;

  Future setSeenonboard() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    seenOnboard = await pref.setBool("seenOnboard", true);
    // this will set seenOnboard to true when running onboard page for the first time.
  }

  @override
  void initState() {
    super.initState();

    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index != 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                alignment: const Alignment(0, 0.65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          // _controller.jumpToPage(2);
                          Navigator.of(context)
                              .pushNamed(WelcomeScreen.routeName);
                        },
                        child: Text(
                          "Skip",
                          style: headingTextStyle,
                        )),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const SlideEffect(
                        activeDotColor: colorPrimary,
                        dotColor: Colors.grey,
                      ),
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       _controller.nextPage(
                    //           duration: Duration(milliseconds: 500),
                    //           curve: Curves.easeIn);
                    //     },
                    //
                    //    child: Text("Next")),

                    onLastPage
                        ? CustomButton(
                            onPress: () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            title: "Next",
                          )
                        : CustomButton(
                            onPress: () {
                              Navigator.of(context)
                                  .pushNamed(WelcomeScreen.routeName);
                            },
                            title: "done",
                          )
                  ],
                )),
          ),
          // Container(
          //   child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text("Skip"),
          //         Text("Next"),
          //       ]),
          // ),
        ],
      ),
    );
  }
}
