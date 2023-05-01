import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';

class IntroScreen extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String count;

  const IntroScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.count});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // color: Colors.green[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Image(
            image: AssetImage(image),
            height: size.height * 0.5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            "$count/3",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: secondary),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
