import 'package:flutter/material.dart';
import 'package:my_flutter_first_app/widgets/PrimaryTextForm.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey();

  var first_name = "";
  var last_name = "";
  var email = "";
  var phone = "";
  var password = "";
  var confirm_Password = "";

  // Controller
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
            height: 720.0,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 230, 227, 227),
                            blurRadius: 0.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/logo.jpg'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Create a new account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: PrimaryTextForm(
                      hintText: 'Enter your first name',
                      prefixIcon: Icons.person,
                      controller: firstNameController,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PrimaryTextForm(
                        hintText: 'Enter your last name',
                        controller: lastNameController,
                        prefixIcon: Icons.person,
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PrimaryTextForm(
                        hintText: 'Enter your email',
                        controller: emailController,
                        prefixIcon: Icons.email,
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PrimaryTextForm(
                        hintText: 'Enter your mobile',
                        controller: phoneController,
                        prefixIcon: Icons.phone_android,
                      )),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: PrimaryTextForm(
                      hintText: 'Create a new password',
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: PrimaryTextForm(
                      hintText: 'Re-enter your password',
                      controller: confirmPasswordController,
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange[700],
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
