
import 'package:loginsignup/job.dart';
import 'package:loginsignup/setting.dart';
import 'package:loginsignup/views/Events.dart';
import 'package:loginsignup/views/setting/editprofile.dart';
import 'package:loginsignup/views/userprofile.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomePageContent(),
          JobSearchPage(),
          NotificationsPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        fixedColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  HomePageContent({Key? key}) : super(key: key);
  List<String> images = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: 90, // Adjust the height as needed
            ),
            SizedBox(
              height: 230,
              width: MediaQuery.of(context).size.width - 10,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < images.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        images[i],
                        height: 150,
                        width: 150,
                        fit: BoxFit.contain,
                      ),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfilePage(),
                            ),
                          );
                        },
                        child: const IconBox(
                          icon: Icons.edit,
                          label: 'Edit Profile',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfilePage(),
                            ),
                          );
                        },
                        child: const IconBox(
                          icon: Icons.person,
                          label: 'User Profile',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsPage(),
                            ),
                          );
                        },
                        child: const IconBox(
                          icon: Icons.settings_system_daydream_rounded,
                          label: 'System',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Events(),
                            ),
                          );
                        },
                        child: const IconBox(
                          icon: Icons.calendar_month_rounded,
                          label: 'Events & Reunion',
                        ),
                      ),
                    ],
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

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // Your NotificationsPage content here
        // ...
        );
  }
}

class IconBox extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconBox({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      width: 130,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 55,
            color: const Color.fromARGB(255, 0, 149, 255),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color.fromARGB(255, 32, 40, 51)),
          ),
        ],
      ),
    );
  }
}
