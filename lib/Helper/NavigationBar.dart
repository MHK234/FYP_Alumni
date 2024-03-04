import 'package:flutter/cupertino.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:loginsignup/Screens/Home/Dashboard/Chat/Chat2.dart';
import 'package:loginsignup/setting.dart';
import '../Screens/Home/Dashboard/Feed/NewsFeed.dart';
import '../Screens/Home/Dashboard/Profile/ProfileSetting.dart';
import '../Screens/Home/Dashboard/Profile/User_Profile.dart';
import '../views/setting/editprofile.dart';
import '../job.dart';

class NavigationBarScreen extends StatefulWidget {
  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  final List<Widget> _screens = [
    NewsFeed(),
    Chat2(),
    JobSearchPage(),
    Profile_Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blue, // Adjust as needed
      controller: _advancedDrawerController,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: Icon(Icons.menu),
          ),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          items: [
            Icon(
              Icons.feed,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.chat,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.work,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ],
          color: Colors.blue,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.blue,
          index: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              _advancedDrawerController
                  .hideDrawer(); // Close drawer after navigation
            });
          },
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Container(
                        width: 300,
                        height: 180,
                        child: Image.asset('assets/images/logo_org 1.png')),
                  ),
                  ListTile(
                    title: Text('Profile'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProfilePage()));
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Events'),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Help_SupportScreen()));
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Job Listings'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobSearchPage()));
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Mentorship'),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Donations and Fundraising'),
                    onTap: () {
                      // Implement share functionality
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Notifications'),
                    onTap: () {
                      // Implement share functionality
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Search and Discovery'),
                    onTap: () {
                      // Implement share functionality
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    onTap: () {
                      // Implement share functionality
                      _advancedDrawerController.hideDrawer();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
