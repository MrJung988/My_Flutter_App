import 'package:flutter/material.dart';
import 'package:my_flutter_first_app/widgets/PrimaryTextForm.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  var new_password = "";
  bool tempObscureText = true;

  // Controller
  final newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 100,
        ),
        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Change your password here",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(),
                  PrimaryTextForm(
                      hintText: 'Enter your new password',
                      obscureText: tempObscureText,
                      prefixIcon: Icons.lock,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            tempObscureText = !tempObscureText;
                          });
                        },
                        child: Icon(tempObscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      controller: newPasswordController,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Please enter your new password";
                        }
                      }),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Change Password"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
