import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/screens/auth/auth_page.dart';
import 'package:medical_project/screens/doctor/doctor_home_page.dart';
import 'package:medical_project/screens/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late User _currentUser;
  late Stream<QuerySnapshot<Map<String, dynamic>>> _userStream;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _currentUser = snapshot.data!;
            print(snapshot.data);
            return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('uid', isEqualTo: _currentUser.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final userData = snapshot.data!.docs.first.data();

                  if (userData['type'] == 'doctor') {
                    return DoctorHomePage();
                  } else {
                    return HomePage();
                  }
                });
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
