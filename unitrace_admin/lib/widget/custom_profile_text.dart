import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: InputBorder.none
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter ${labelText}';
      }
      return null;
    },
    );
  }
}
