import 'package:flutter/material.dart';
import 'package:my_flutter_first_app/auth/login.dart';
import 'package:my_flutter_first_app/auth/register.dart';
import 'package:my_flutter_first_app/home/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/login': (context) => Login(),
      '/register': (context) => Register(),
      '/home': (context) => Home()
    },
  ));
}
