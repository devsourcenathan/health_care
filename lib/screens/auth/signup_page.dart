import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/screens/auth/login_page.dart';
import 'package:medical_project/widgets/my_button.dart';
import 'package:medical_project/widgets/my_text_field.dart';
import 'package:medical_project/widgets/square_tile.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //sign in method
  Future signUserUp() async {
    showDialog(
      context: context,
      builder: (contex) {
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
      print(e.message);
    }
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                const Icon(
                  Icons.house_rounded,
                  size: 80,
                ),

                const SizedBox(
                  height: 20,
                ),
                //welcome

                Text(
                  "Bienvenue, inscrivez vous pour continuer",
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
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),
                //username

                MyTextField(
                  controller: usernameController,
                  hintText: "Nom d'utilisateur",
                  obscureText: false,
                ),

                const SizedBox(
                  height: 20,
                ),
                //password
                MyTextField(
                  controller: passwordController,
                  hintText: "Mot de passe",
                  obscureText: true,
                ),

                const SizedBox(
                  height: 25,
                ),

                //Sign in Button
                MyButton(
                  onTap: signUserUp,
                  text: "S'inscrire",
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
                          "Ou continuer avec",
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
                    SquareTile(imagePath: 'lib/images/logos/google.png'),
                    SizedBox(
                      width: 25,
                    ),
                    SquareTile(imagePath: 'lib/images/logos/apple.png'),
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
                      "Déjà inscrit ?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => goTo(context, LoginPage()),
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
