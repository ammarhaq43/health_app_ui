import 'package:flutter/material.dart';

class CustomRoundedTextField extends StatelessWidget {
  final String hintText;
  final String iconPath;
  final TextEditingController? controller;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CustomRoundedTextField({
    Key? key,
    required this.hintText,
    required this.iconPath,
    this.controller,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(iconPath),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
        validator: validator,
      ),
    );
  }
}