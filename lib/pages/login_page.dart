import 'package:booking_app_source/core/helpers/asset_helper.dart';
import 'package:booking_app_source/representation/screen/main_app.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_source/components/my_button.dart';
import 'package:booking_app_source/components/my_textfield.dart';
import '../components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class AuThen {
  static List<Map<String, String>> users = [
    {'username': 'user@gmail.com', 'password': '123456', 'fullName': 'User 1'},
  ];
  static Map<String, String>? currentUser;
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUserIn() {
  String username = emailController.text.trim();
  String password = passwordController.text.trim();

  bool userFound = false;

  for (var user in AuThen.users) {
    if (user['username'] == username && user['password'] == password) {
      userFound = true;
      AuThen.currentUser = user;
      break;
    }
  }

  if (userFound) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainApp(),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email or Password is not CORRECT'),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 200,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome back Booking App!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  prefixIcon: const Icon(Icons.person, color: Colors.black),
                  hintText: "Email",
                  labelText: 'Email',
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  hintText: "Password",
                  labelText: 'Password',
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.red[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: signUserIn,
                  text: "Sign in",
                ),
                const SizedBox(height: 50),
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
                          'Or Continue with',
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: AssetHelper.google),
                    SizedBox(width: 25),
                    SquareTile(imagePath: AssetHelper.apple)
                  ],
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a remember?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
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
