import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return _buildTextField(context);
  }

  Widget _buildTextField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: _buildInputDecoration(context),
      ),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      enabledBorder: _buildEnabledBorder(context),
      focusedBorder: _buildFocusedBorder(context),
    );
  }

  OutlineInputBorder _buildEnabledBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
    );
  }

  OutlineInputBorder _buildFocusedBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}
