import 'package:bible_app/components/my_button.dart';
import 'package:bible_app/components/square_tile.dart';
import 'package:flutter/material.dart';
import 'package:bible_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //sign user in
  void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.lock,
                size: 100,
              ),

              SizedBox(height: 50),
              // welcome
              Text(
                'Welcome back Calvin',
                style: TextStyle(
                  color: Color.fromARGB(255, 80, 78, 78),
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 25),
              // username
              MyTextfield(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              SizedBox(height: 18),
              // password
              MyTextfield(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 18),
              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              // sign-in button
              MyButton(
                onTap: signUserIn,
              ),
              SizedBox(height: 25),
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
              SizedBox(height: 50),
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

              SizedBox(height: 50),
              // register
              Text('Not a member?'),
              const SizedBox(width: 4),
              Text('Register now'),
            ],
          ),
        ),
      ),
    );
  }
}
