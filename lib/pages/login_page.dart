import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_textfield.dart';
import 'package:food_delivery/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIcon(context),
          _buildAppName(context),
          _buildForm(context),
          _buildButton(context),
          _buildRegisterLink(context),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Icon(
      Icons.lock_open_rounded,
      size: 100,
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  Widget _buildAppName(BuildContext context) {
    return Text(
      "Food Delivery App",
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        MyTextField(
          controller: emailController,
          hintText: "Email",
          obscureText: false,
        ),
        MyTextField(
          controller: passwordController,
          hintText: "Password",
          obscureText: true,
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return MyButton(
      text: "Sign In",
      onTap: login,
    );
  }

  Widget _buildRegisterLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Not a Member?",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: widget.onTap,
          child: Text(
            "Register Now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
