import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_project/screens/onboarding/test_screen.dart';
import 'package:medical_project/utils/firebase_options.dart';
import 'package:medical_project/screens/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
