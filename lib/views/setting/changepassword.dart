import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/password/password.dart';

class ChangePasswordPage extends StatelessWidget {
  final double radius = 20.0;
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPasswordController.text,
        );

        // Reauthenticate User
        await user.reauthenticateWithCredential(credential);

        // Change password
        await user.updatePassword(newPasswordController.text);
      }
    } catch (error) {
      // Handle errors, show error message, or log the error
      print('Error changing password: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
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
                height: 60,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 240, 240),
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: PasswordTextField(
                        obscureText: true,
                        controller: currentPasswordController,
                        labelText: 'Current Password',
                        onToggleVisibility: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: PasswordTextField(
                        obscureText: true,
                        controller: newPasswordController,
                        labelText: 'New Password',
                        onToggleVisibility: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: PasswordTextField(
                        obscureText: true,
                        controller: confirmNewPasswordController,
                        labelText: 'Confirm New Password',
                        onToggleVisibility: () {},
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Check if the new password and confirm password match
                        if (newPasswordController.text == confirmNewPasswordController.text) {
                          // Call the change password method
                          _changePassword();
                        } else {
                          print('New password and confirm password do not match');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color of the button
                        onPrimary: Colors.white, // Text color of the button
                      ),
                      child: const Text('Change Password'),
                    ),
                    const SizedBox(height: 20)
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
