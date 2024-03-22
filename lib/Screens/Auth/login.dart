import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:loginsignup/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helper/NavigationBar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:permission_handler/permission_handler.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

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
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onPressed: () async {
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationBarScreen()));
                      try {
                        final UserCredential user = await signInWithFacebook();
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationBarScreen()),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
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
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    onPressed: () {
                      signInWithGoogle(context);
                    }, // Handle Google login here
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

Future<UserCredential?> signInWithGoogle(context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);

      final User? user = authResult.user;
      //(user?.getIdToken());
      String uid = user!.uid;
      print("User Id is " + uid);
      firestore.collection('users').doc(uid).set({
        'firstName': user.displayName,
        'PhoneNumber': user.phoneNumber,
        'email': user.email,
        'isEmailVerified': user.emailVerified
      });
      //print(authResult);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('loggedIn', true);
      prefs.setString('userId', uid);

      PermissionStatus storage = await Permission.photos.request();
      if (storage == PermissionStatus.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Permission is Mandatory")));
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavigationBarScreen()),
      );

      return authResult;
    }
  } catch (error) {
    print(error);
    return null;
  }
  return null;
}

signInWithFacebook() async {
  final LoginResult loginResult = await FacebookAuth.instance.login();
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
