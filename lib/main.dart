/*import 'package:flutter/material.dart';
import 'package:loginsignup/Screens/splash/splashscreen.dart';

void main() {
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

*/
import 'package:loginsignup/home.dart';
import 'package:loginsignup/views/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:loginsignup/Screens/splash/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Check the login status
  bool loggedIn = await checkLoginStatus();

  runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen()));
}

Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('loggedIn') ?? false;
}
