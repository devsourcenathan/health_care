import 'package:flutter/material.dart';
import 'package:medical_project/screens/auth/login_page.dart';
import 'package:medical_project/screens/home/home_page.dart';
import 'package:medical_project/widgets/intro_screen.dart';
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
  final PageController _controller = PageController();

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
            alignment: const Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                !onLastPage
                    ? GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: const Text(
                          'Passer',
                          style: TextStyle(color: primary),
                        ),
                      )
                    : const Text(''),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: CustomizableEffect(
                    dotDecoration: const DotDecoration(
                      width: 12,
                      height: 8,
                      color: secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(2),
                      ),
                      verticalOffset: 0,
                    ),
                    activeDotDecoration: DotDecoration(
                      width: 25,
                      height: 12,
                      color: primary,
                      rotationAngle: 180,
                      verticalOffset: -10,
                      borderRadius: BorderRadius.circular(50),
                      // dotBorder: DotBorder(
                      //   padding: 2,
                      //   width: 2,
                      //   color: Colors.indigo,
                      // ),
                    ),
                  ),
                ),
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
                        child: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 50,
                          color: primary,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Icon(
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
