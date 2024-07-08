import 'package:bible_app/components/my_button.dart';
import 'package:bible_app/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bible_app/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //sign user in
  void signUserUp() async {
    // Show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign the user up
    try {
      // Validate the password
      if (passwordController.text == confirmPasswordController.text) {
        // if true then create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message
        defaultErrorMessage("Password don't match!");
      }
      // pop the loading indicator
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading indicator
      Navigator.pop(context);
      // show error message
      defaultErrorMessage(e.code);
      print(e.code);
    }
  }

  void defaultErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.grey,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ));
      },
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
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 25),
                // Creating an account
                const Text(
                  'Let\'s create an account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 80, 78, 78),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                // email
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 18),
                // password
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 18),

                MyTextfield(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 18),

                const SizedBox(height: 25),
                // sign-in button
                MyButton(
                  text: 'Sign-Up',
                  onTap: signUserUp,
                ),
                const SizedBox(height: 25),
                // or continue with
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
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
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
                const SizedBox(height: 50),
                // google + apple sign-in button
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'lib/images/google-sign.png'),
                    SizedBox(
                      width: 10,
                    ),
                    // apple button
                    SquareTile(imagePath: 'lib/images/apple-sign.png'),
                  ],
                ),
                const SizedBox(height: 50),
                // register
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    'Login now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
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
