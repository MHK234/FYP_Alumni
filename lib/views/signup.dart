import 'package:loginsignup/views/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/password/password.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final double radius = 20.0;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureCPassword = true;

  bool emailValidator(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9_.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(email);
  }

  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String emailError = '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(222, 239, 239, 218),
                Color.fromARGB(255, 206, 198, 198),
                Color.fromARGB(196, 224, 210, 210),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/logo1.png',
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 480,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 240, 240),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          suffixIcon: Icon(
                            FontAwesomeIcons.user,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        textCapitalization: TextCapitalization.words,
                        controller: lastNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          suffixIcon: Icon(
                            FontAwesomeIcons.user,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          suffixIcon: const Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          ),
                          errorText: emailController.text.isNotEmpty &&
                                  !emailValidator(emailController.text)
                              ? 'Invalid email format'
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 200,
                      child: PasswordTextField(
                        controller: passwordController,
                        obscureText: _obscurePassword,
                        labelText: 'Enter Password',
                        onToggleVisibility: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      width: 200,
                      child: PasswordTextField(
                        controller: cpasswordController,
                        obscureText: _obscureCPassword,
                        labelText: 'Confirm Password',
                        onToggleVisibility: () {
                          setState(() {
                            _obscureCPassword = !_obscureCPassword;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (firstNameController.text.isEmpty ||
                            lastNameController.text.isEmpty ||
                            emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            cpasswordController.text.isEmpty) {
                          showErrorMessage('All fields are required');
                        } else if (!emailValidator(emailController.text)) {
                          showErrorMessage('Invalid email format');
                        } else if (passwordController.text !=
                            cpasswordController.text) {
                          showErrorMessage('Passwords do not match');
                        } else {
                          try {
                            UserCredential userCredential =
                                await _auth.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            String uid = userCredential.user!.uid;

                            firestore.collection('users').doc(uid).set({
                              'firstName': firstNameController.text,
                              'lastName': lastNameController.text,
                              'email': emailController.text,
                              'password': passwordController.text,
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          } catch (e) {}
                        }

                        firstNameController.clear();
                        lastNameController.clear();
                        emailController.clear();
                        passwordController.clear();
                        cpasswordController.clear();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF2D34AB),
                              Color(0xFF1454B4),
                              Color(0xFF0095FF),
                            ],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Log In',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
