import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medical_project/screens/home/main_page.dart';
import 'package:medical_project/utils/firebase_options.dart';
import 'package:medical_project/screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences pref = await SharedPreferences.getInstance();
  isViewed = pref.getBool('onBoard');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isViewed == true ? const MainPage() : const OnBoardingScreen(),
      // home: AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
