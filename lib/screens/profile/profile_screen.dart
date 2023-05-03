import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/text.dart';
import 'package:medical_project/widgets/my_item_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    LineIcons.arrowLeft,
                    size: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundColor: secondary,
                    child: Text('Image profile'),
                  ),
                ),
                const Text(
                  'Nathan Tchinda',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
                const Text(
                  'sadenachbinathan@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileItem(
              leftIcon: LineIcons.database,
              rightIcon: Icons.chevron_right,
              itemTitle: dataText,
              onTap: () {},
            ),
            ProfileItem(
              leftIcon: LineIcons.calendar,
              rightIcon: Icons.chevron_right,
              itemTitle: planningText,
              onTap: () {},
            ),
            ProfileItem(
              leftIcon: LineIcons.bell,
              rightIcon: Icons.chevron_right,
              itemTitle: notificationText,
              onTap: () {},
            ),
            ProfileItem(
              leftIcon: Icons.settings,
              rightIcon: Icons.chevron_right,
              itemTitle: settingText,
              onTap: () {},
            ),
            ProfileItem(
              leftIcon: Icons.logout_outlined,
              itemTitle: logoutText,
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
