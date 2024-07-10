import 'package:flutter/material.dart';
import 'package:booknewtable/components/my_button.dart';
import 'package:booknewtable/components/my_textfield.dart';
import 'package:booknewtable/pages/home_page.dart';
import 'package:booknewtable/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _authService =
      AuthService(); // Move AuthService instance to class level

  // Login method
  void login() async {
    try {
      await _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );

      // Navigate to home page after successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            // Message, app slogan
            Text(
              "Book A Table",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            const SizedBox(height: 25),

            // Email
            MyTextfield(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            // Password
            MyTextfield(
              controller: passwordController,
              hintText: "Password",
              obscureText: true, // Password field should be obscured
              onTogglePasswordVisibility: () {
                setState(
                    () {}); // Trigger rebuild to reflect password visibility change
              },
            ),

            const SizedBox(height: 25),

            // Sign In Button
            MyButton(
              text: "Sign In",
              onTap: login,
            ),

            const SizedBox(height: 25),

            // Not a member? Register Now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
