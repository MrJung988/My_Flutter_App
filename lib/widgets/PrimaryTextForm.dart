import 'package:flutter/material.dart';

class PrimaryTextForm extends StatelessWidget {
  String hintText;
  IconData prefixIcon;
  IconData? suffixIcon;

  PrimaryTextForm({
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        hintText: hintText,
        suffixIcon: Icon(
          suffixIcon,
          color: Colors.black,
          size: 20,
        ),
      ),
    );
  }
}
