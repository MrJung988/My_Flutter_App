import 'package:flutter/material.dart';

class PrimaryTextForm extends StatelessWidget {
  String hintText;
  IconData prefixIcon;
  InkWell? suffixIcon;
  TextEditingController controller;
  FormFieldValidator validator;
  bool obscureText;

  PrimaryTextForm({
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.orange[700],
          size: 20,
        ),
        fillColor: Colors.grey[100],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 15,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      validator: validator,
    );
  }
}
