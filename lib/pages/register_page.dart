import 'package:chatapp/services/auth/auth_services.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  // email and password textfields controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  final void Function()? onTap;

  RegisterView({super.key, required this.onTap});
  // Register function
  void Register(BuildContext context) async {
    final auth = AuthService();

    if (passwordController.text != confPasswordController.text) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords do not match."),
        ),
      );
    } else {
      try {
        await auth.registerWithEmailAndPassword(
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
              "Create an account!",
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
            const SizedBox(height: 10),
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: confPasswordController,
            ),
            const SizedBox(height: 25),
            MyButton(text: "Register", onTap: () => Register(context)),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already a member? ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary)),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login Now",
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
