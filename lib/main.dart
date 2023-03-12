import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_first_app/auth/login.dart';
import 'package:my_flutter_first_app/auth/register.dart';
import 'package:my_flutter_first_app/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return MaterialApp(
            initialRoute: '/login',
            routes: {
              '/login': (context) => Login(),
              '/register': (context) => Register(),
              '/home': (context) => Home()
            },
          );
        });
  }
}
