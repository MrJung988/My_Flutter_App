import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.orange[700],
      ),
      body: Center(
        child: Text('Hello home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
