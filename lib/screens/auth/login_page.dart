import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/images_path.dart';
import 'package:medical_project/utils/text.dart';
import 'package:medical_project/widgets/my_button.dart';
import 'package:medical_project/widgets/my_text_field.dart';
import 'package:medical_project/widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? toggleScreen;

  const LoginPage({super.key, required this.toggleScreen});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //sign in method
  Future signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      showMessage(e.code);
    }

    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => HomeScreen(),
    //   ),
    // );
  }

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(Icons.error_outline_rounded),
          iconColor: primary_red,
          title: Text(
            message,
            style: const TextStyle(color: primary_red),
          ),
          // title: Text(message),
        );
      },
    );
  }

  void goTo(context, page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
    // super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    "lib/images/doctors/doctors.png",
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //welcome

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      loginMessageText,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      appName,
                      style: TextStyle(
                          color: primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ", ",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      loginText.toLowerCase(),
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //username

                MyTextField(
                  controller: usernameController,
                  hintText: mailText,
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: passwordText,
                  obscureText: true,
                ),

                const SizedBox(
                  height: 20,
                ),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        forgotText,
                        style: TextStyle(color: primary),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //Sign in Button
                MyButton(onTap: () => signUserIn(), text: loginText),

                const SizedBox(
                  height: 20,
                ),

                //continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          otherText,
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                //icons buttons
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SquareTile(imagePath: googlePath),
                    SizedBox(
                      width: 25,
                    ),
                    SquareTile(imagePath: applePath),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                //register now
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        notAccountText,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.toggleScreen,
                        child: const Text(
                          signUpNowText,
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
