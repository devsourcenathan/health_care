import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/utils/color.dart';
import 'package:medical_project/utils/images_path.dart';
import 'package:medical_project/utils/text.dart';
import 'package:medical_project/widgets/my_button.dart';
import 'package:medical_project/widgets/my_text_field.dart';
import 'package:medical_project/widgets/square_tile.dart';

class SignupPage extends StatefulWidget {
  final Function()? toggleScreen;
  const SignupPage({super.key, required this.toggleScreen});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //sign in method
  Future signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  // void goTo(context, page) {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => page,
  //     ),
  //   );
  // }

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
                const Icon(
                  Icons.medical_services,
                  size: 80,
                  color: primary,
                ),

                const SizedBox(
                  height: 20,
                ),
                //welcome

                Text(
                  signUpMessageText,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //username

                MyTextField(
                  controller: usernameController,
                  hintText: usernameText,
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),
                //username

                MyTextField(
                  controller: emailController,
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
                  height: 25,
                ),

                //Sign in Button
                MyButton(
                  onTap: signUserUp,
                  text: signInText,
                ),

                const SizedBox(
                  height: 10,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      alreadyAccountText,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.toggleScreen,
                      child: const Text(
                        signInNowText,
                        style: TextStyle(
                            color: primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
