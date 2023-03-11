import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'User ID: 156AD45',
            style: TextStyle(fontSize: 18.0),
          ),
          Row(
            children: [
              Text(
                'Email: leo@messi.com',
                style: TextStyle(fontSize: 18.0),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Verify Email'),
              ), 
            ],
          ),
          Text(
            'Created: 1/3/2023',
            style: TextStyle(fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
