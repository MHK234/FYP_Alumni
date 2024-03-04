import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/Screens/splash/splashscreen.dart';
import 'package:loginsignup/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Alumni_Connect());
}

class Alumni_Connect extends StatelessWidget {
  const Alumni_Connect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(),
      routes: {
        '/home': (context) => AnimatedSplashScreen(), // Your main app screen
      },
    );
  }
}



