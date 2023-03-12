import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_first_app/auth/login.dart';
import 'package:my_flutter_first_app/home/dashboard.dart';
import 'package:my_flutter_first_app/home/home.dart';
import 'package:my_flutter_first_app/widgets/PrimaryTextForm.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  var first_name = "";
  var last_name = "";
  var email = "";
  var phone = "";
  var password = "";
  var confirm_Password = "";
  bool tempObscureTextForPassword = true;
  bool tempObscureTextForConfirmPassword = true;

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

  registration() async {
    if (password == confirm_Password) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "New user register successfully",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password is too weak");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password is too weak",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account already exists",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          );
        }
      }
    } else {
      print("Password and confirm password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Password and confirm password doesn't match ",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ),
      );
    }
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
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your first name';
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PrimaryTextForm(
                        hintText: 'Enter your last name',
                        controller: lastNameController,
                        prefixIcon: Icons.person,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your last name';
                          }
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PrimaryTextForm(
                        hintText: 'Enter your email',
                        controller: emailController,
                        prefixIcon: Icons.email,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your email';
                          } else if (!value!.contains('@')) {
                            return 'Please enter a valid email';
                          }
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: PrimaryTextForm(
                        hintText: 'Enter your mobile',
                        controller: phoneController,
                        prefixIcon: Icons.phone_android,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Please enter your phone';
                          }
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: PrimaryTextForm(
                      obscureText: tempObscureTextForPassword,
                      hintText: 'Create a new password',
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            tempObscureTextForPassword =
                                !tempObscureTextForPassword;
                          });
                        },
                        child: Icon(tempObscureTextForPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your new password';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: PrimaryTextForm(
                      obscureText: tempObscureTextForConfirmPassword,
                      hintText: 'Re-enter your password',
                      controller: confirmPasswordController,
                      prefixIcon: Icons.lock,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            tempObscureTextForConfirmPassword =
                                !tempObscureTextForConfirmPassword;
                          });
                        },
                        child: Icon(tempObscureTextForConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      // suffixIcon: Icons.remove_red_eye,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your confirm password';
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            setState(() {
                              first_name = firstNameController.text;
                              last_name = lastNameController.text;
                              email = emailController.text;
                              phone = phoneController.text;
                              password = passwordController.text;
                              confirm_Password = confirmPasswordController.text;
                            });

                            registration();
                          }
                        },
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
