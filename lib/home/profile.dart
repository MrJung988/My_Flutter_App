import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/lm10.jpg'),
                ),
              ],
            ),
            Divider(),
            RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                        text: 'User ID: ',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '242156AD45', style: TextStyle(fontSize: 18.0)),
                  ]),
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                            text: 'Email: ',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: 'leo@messi.com',
                            style: TextStyle(fontSize: 18.0)),
                      ]),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Verify Email'),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                        text: 'Created at: ',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: '1/3/2023', style: TextStyle(fontSize: 18.0)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
