import 'package:flutter/material.dart';
import 'package:loginsignup/Helper/NavigationBar.dart';
import 'package:loginsignup/Screens/Auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            // User is signed in, navigate to home screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigationBarScreen()),
            );
          } else if (user == null) {
            // User is not signed in, navigate to sign-in screen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          }
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4196E3), Color(0xff0b469f)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SlideTransition(
            position: _animation,
            child: Image.asset('assets/images/logo_org 1.png'),
          ),
        ),
      ),
    );
  }
}
