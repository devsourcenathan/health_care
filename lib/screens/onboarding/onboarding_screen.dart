import 'package:flutter/material.dart';
import 'package:medical_project/screens/auth/login_page.dart';
import 'package:medical_project/screens/home/home_page.dart';
import 'package:medical_project/screens/onboarding/intro_screen.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/images_path.dart';
import 'package:medical_project/utils/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = index == 2;
              });
            },
            children: const [
              IntroScreen(
                image: onBoardingImage1,
                title: title1,
                description: subtitle1,
                count: "1",
              ),
              IntroScreen(
                image: onBoardingImage2,
                title: title1,
                description: subtitle1,
                count: "2",
              ),
              IntroScreen(
                image: onBoardingImage3,
                title: title1,
                description: subtitle1,
                count: "3",
              ),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                !onLastPage
                    ? GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: Text('skip'),
                      )
                    : Text(''),
                SmoothPageIndicator(controller: _controller, count: 3),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 30,
                          color: primary,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 30,
                          color: secondary,
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
