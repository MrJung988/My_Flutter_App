import 'package:flutter/material.dart';

class PrimaryTextForm extends StatelessWidget {
  String hintText;
  PrimaryTextForm({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail,
          color: Colors.orange[700],
          size: 20,
        ),
        fillColor: Colors.grey[100],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
      ),
    );
  }
}
