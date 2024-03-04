import 'package:flutter/material.dart';
import 'package:loginsignup/views/login.dart';

import '../../Helper/NavigationBar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4196E3), Color(0xff1454b4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_org 1.png'),
                SizedBox(height: 20),

                // Row for Facebook login
                Container(
                  width: 300,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onPressed: () {
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationBarScreen()));
                      print("Facebook Login deployed");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                                'assets/images/facebook.png')), // Replace with Facebook icon
                        SizedBox(width: 10),
                        Text(
                          'Signup with Facebook',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 15),

                // Row for Google login
                Container(
                  width: 300,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onPressed: () {}, // Handle Google login here
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 24,
                            height: 24,
                            child: Image.asset(
                                'assets/images/google.png')), // Replace with Google icon
                        SizedBox(width: 10),
                        Text(
                          'Signup with Google',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  child: InkWell(
                    child: Center(
                        child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()))
                    },
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: 300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
