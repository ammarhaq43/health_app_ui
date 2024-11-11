import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final String icon;
  final Widget? rigtIcon;
  final bool obscureText;
  final EdgeInsets? margin;
  final Color textColor;
  final Color borderColor;
  final Color hintColor;
  final String? Function(String?)? validator;

  const RoundTextField({
    super.key,
    required this.hitText,
    required this.icon,
    this.controller,
    this.margin,
    this.keyboardType,
    this.obscureText = false,
    this.rigtIcon,
    this.textColor = Colors.black,
    this.borderColor = Colors.grey,
    this.hintColor = Colors.black45,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: TColo.lightGrey,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(color: textColor),
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hitText,
          hintStyle: TextStyle(color: hintColor, fontSize: 12),
          suffixIcon: rigtIcon,
          prefixIcon: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            child: Image.asset(
              icon,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
              color: hintColor,
            ),
          ),
        ),
      ),
    );
  }
}