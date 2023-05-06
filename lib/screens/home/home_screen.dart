import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 40, bottom: 10),
            child: Text(
              "Explore Posts",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.only(left: 40, bottom: 20),
            child: Text(
              "Des conseils pour votre bien etre",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 22,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),

        //Search bar
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                LineIcons.search,
                color: Colors.white,
                size: 25,
              ),
              Container(
                child: Icon(
                  LineIcons.filter,
                  color: Colors.white,
                  size: 25,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Posts recents",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.grey[800],
                  ),
                ),
                const Text(
                  "voir plus",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
