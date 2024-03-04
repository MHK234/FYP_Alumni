import 'package:flutter/material.dart';
import 'package:loginsignup/views/login.dart';
import 'package:loginsignup/views/setting/changepassword.dart';
import 'package:loginsignup/views/setting/editprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSettingsSection(
                'Account',
                [
                  _buildSettingsOption(
                    'Edit Profile',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingsOption(
                    'Change Password',
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordPage(),
                        ),
                      );
                    },
                  ),
                  _buildSettingsOption('Privacy', () {
                    // Handle Privacy option
                  }),
                ],
              ),
              const SizedBox(height: 20),
              _buildSettingsSection(
                'Notifications',
                [
                  _buildSettingsOption(
                    'Show Notification',
                        () {
                      // Handle notification toggle
                    },
                    isSwitch: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSettingsSection(
                'More',
                [
                  _buildSettingsOption('Language', () {
                    // Handle Language option
                  }),
                  _buildSettingsOption('Terms and Conditions', () {
                    // Handle Terms and Conditions option
                  }),
                  _buildSettingsOption('About Us', () {
                    // Handle About Us option
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    prefs.setBool('loggedIn', false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection(String label, List<Widget> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: options,
        ),
      ],
    );
  }

  Widget _buildSettingsOption(String label, Function() onTap,
      {bool isSwitch = false}) {
    return ListTile(
      title: isSwitch
          ? Row(
        children: [
          Text(label),
          Spacer(),
          Switch(
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
              // Handle toggle notifications logic
            },
            activeColor: Colors.blue,
          ),
        ],
      )
          : Text(label),
      onTap: () async {
        if (label == 'Logout') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        } else {
          onTap(); // For other options, execute the provided onTap function
        }
      },
    );
  }
}
