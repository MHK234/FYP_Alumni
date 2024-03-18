import 'package:firebase_core/firebase_core.dart';
import 'package:loginsignup/Helper/NavigationBar.dart';
import 'package:loginsignup/views/signup.dart';
import 'package:loginsignup/views/userprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/password/password.dart';
import 'forgetpassword.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class LoginPage extends StatelessWidget {
  final double radius = 20.0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$message'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                height: 100, // Adjust the height as needed
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 350,
                width: 270,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 240, 240),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          suffixIcon: Icon(
                            FontAwesomeIcons.envelope,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 200,
                      child: PasswordTextField(
                        obscureText: _obscurePassword,
                        controller: _passwordController,
                        labelText: 'Enter Password',
                        onToggleVisibility: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to ForgetPasswordPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPasswordPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Forget Password',
                              style: TextStyle(color: Colors.blue[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    GestureDetector(
                      onTap: () async {
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();

                        if (email.isNotEmpty && password.isNotEmpty) {
                          if (EmailValidator.validate(email)) {
                            try {
                              UserCredential userCredential =
                                  await _auth.signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              String uid = userCredential.user!.uid;
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('loggedIn', true);
                              prefs.setString('userId', uid);

                              // Check if userdata collection has a document with the user's UID
                              DocumentReference userDocumentRef =
                                  FirebaseFirestore.instance
                                      .collection('userdata')
                                      .doc(uid);

                              bool documentExists = await userDocumentRef
                                  .get()
                                  .then((snapshot) => snapshot.exists);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NavigationBarScreen()));
                            } catch (e) {
                              // Handle login errors
                              showErrorMessage(context, e.toString());
                              print(e.toString());
                            }
                          } else {
                            showErrorMessage(context, 'Invalid email format');
                          }
                        } else if (email.isEmpty) {
                          showErrorMessage(context, 'Enter Email');
                        } else if (password.isEmpty) {
                          showErrorMessage(context, 'Enter Password');
                        } else {
                          // Handle other cases if needed
                        }

                        _emailController.clear();
                        _passwordController.clear();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF2FC1FF),
                              Color(0xFF1454B4),
                              Color(0xFF0095FF),
                            ],
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
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
                            builder: (context) => SignUpPage(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Create New account? ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign Up',
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
                    const Text(
                      'Or Login Using Social Media',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          FontAwesomeIcons.facebook,
                          color: Color.fromARGB(255, 0, 157, 255),
                        ),
                        Icon(
                          FontAwesomeIcons.envelope,
                          color: Color.fromARGB(255, 0, 157, 255),
                        ),
                      ],
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
