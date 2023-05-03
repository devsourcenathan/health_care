import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:medical_project/screens/profile/profile_screen.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/text.dart';

class MyBottomNavigationBar extends StatefulWidget {
  // final Function onTap;
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  void onTap(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: primary,
            iconSize: 24,
            padding: const EdgeInsets.all(12),
            duration: const Duration(milliseconds: 500),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.white,
            tabs: [
              const GButton(
                icon: LineIcons.home,
                text: home,
              ),
              const GButton(
                icon: LineIcons.search,
                text: search,
              ),
              const GButton(
                icon: LineIcons.sms,
                text: chat,
              ),
              GButton(
                icon: LineIcons.user,
                text: profile,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              onTap(index);
            },
          ),
        ),
      ),
    );
  }
}
