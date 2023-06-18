import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:medical_project/screens/auth/auth_page.dart';
import 'package:medical_project/screens/doctor/doctor_info.dart';
import 'package:medical_project/screens/home/main_page.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/text.dart';
import 'package:medical_project/widgets/my_item_list.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  late User _currentUser;
  late Stream<QuerySnapshot<Map<String, dynamic>>> _userStream;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser!;
    _userStream = FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: _currentUser.uid)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _userStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }

              final userData = snapshot.data!.docs.first.data();
              final name = userData['name'] ?? '';

              return Container(
                margin: const EdgeInsets.only(top: 60),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
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
                            backgroundImage:
                                AssetImage('lib/images/profile/doc.png'),
                            // child: Text('Image profile'),
                          ),
                        ),
                        Text(
                          "Dr. " + name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: primary,
                          ),
                        ),
                        Text(
                          user.email!,
                          style: const TextStyle(
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorInfo(user: userData),
                          ),
                        );
                      },
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }));
  }
}
