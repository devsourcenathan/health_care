import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/images_path.dart';
import 'package:medical_project/utils/text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: [
              Container(
                padding: const EdgeInsets.all(15),
                color: primary,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Image(image: AssetImage(onBoardingImage1)),
                      Column(
                        children: const [
                          Text("Title 2"),
                          Text(
                            "Subtitle 1",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Text(counter1),
                      SizedBox(
                        height: 40,
                      ),
                    ]),
              ),
              Container(
                color: primary_red,
              ),
              Container(
                color: primary_yellow,
              ),
            ],
          )
        ],
      ),
    );
  }
}
