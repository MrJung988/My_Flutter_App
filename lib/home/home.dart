import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_first_app/home/change_password.dart';
import 'package:my_flutter_first_app/home/dashboard.dart';
import 'package:my_flutter_first_app/home/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List _widgetOptions = [
    Dashboard(),
    Profile(),
    ChangePassword(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.orange[700],
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange[700],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/lm10.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lionel Messi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone_android),
                            Text('+977 9876543210')
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.email),
                            Text('leo.messi@gmail.com')
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Manage Favorite'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text('FAQ'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
      // body: Container(child: null),
      // body: Profile(),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[400],
            icon: Icon(
              Icons.home,
              // color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[400],
            icon: Icon(
              Icons.people,
              // color: Colors.black,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey[400],
            icon: Icon(
              Icons.settings,
              // color: Colors.black,
            ),
            label: 'Settings',
          ),
          // BottomNavigationBarItem(
          //   backgroundColor: Colors.grey[400],
          //   icon: Icon(
          //     Icons.newspaper,
          //     // color: Colors.black,
          //   ),
          //   label: 'Feed',
          // ),
          // BottomNavigationBarItem(
          //   backgroundColor: Colors.grey[400],
          //   icon: Icon(
          //     Icons.more,
          //     // color: Colors.black,
          //   ),
          //   label: 'More',
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (value) {
          _onItemTapped(value);
        },
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message),
          backgroundColor: Colors.orange,
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
