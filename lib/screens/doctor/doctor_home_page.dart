import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:medical_project/screens/doctor/doctor_main_page.dart';
import 'package:medical_project/screens/doctor/doctor_profile_screen.dart';
import 'package:medical_project/screens/home/home_screen.dart';
import 'package:medical_project/screens/messages/messages_screen.dart';
import 'package:medical_project/screens/profile/profile_screen.dart';
import 'package:medical_project/screens/shedule/schedule_screen.dart';
import 'package:medical_project/screens/shedule/search_screen.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/widgets/my_bottom_navigation_bar.dart';
import 'package:medical_project/widgets/my_search_bar.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  final searchController = TextEditingController();
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DoctorMainPage(),
    ScheduleScreen(),
    MessagesScreen(),
    DoctorProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    void onTap(index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      bottomNavigationBar:
          MyBottomNavigationBar(onTap: onTap, selectedIndex: _selectedIndex),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
