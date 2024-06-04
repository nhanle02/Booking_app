import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void registerUser() {
    String fullName = fullNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password == confirmPassword) {
      setState(() {
        AuThen.users.add({'username': email, 'password': password, 'fullName': fullName});
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!'),
        ),
      );
      widget.onTap?.call();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(  // Add this line to enable scrolling if needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open_rounded,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              Text(
                "Let's create an account for you",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(
                controller: fullNameController,
                prefixIcon: const Icon(Icons.person, color: Colors.black),
                hintText: "Full Name",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: emailController,
                prefixIcon: const Icon(Icons.email, color: Colors.black),
                hintText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock, color: Colors.black),
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 10),
              MyTextField(
                controller: confirmPasswordController,
                prefixIcon: const Icon(Icons.lock, color: Colors.black),
                hintText: "Confirm Password",
                obscureText: true,
              ),
              const SizedBox(height: 25),
              MyButton(
                text: "Sign up",
                onTap: registerUser,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign in",
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
      ),
    );
  }
}
