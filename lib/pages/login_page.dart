import 'package:chatapp/auth/auth_services.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatelessWidget {
  // email and password textfields controller
  final void Function()? onTap;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginView({super.key, required this.onTap});

  void login(BuildContext context) async {
    final AuthService _auth = AuthService();

    print("login");
    print(emailController.text);
    print(passwordController.text);

    // Check if email and password are not empty
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Please enter both email and password."),
        ),
      );
      return; // Exit the function if fields are empty
    }

    try {
      await _auth.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } on Exception catch (e) {
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message,
                size: 60, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 50),
            Text(
              "Welcome back,you've been missed",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 16),
            ),
            const SizedBox(height: 25),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 25),
            MyButton(text: "Login", onTap: () => login(context)),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary)),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
