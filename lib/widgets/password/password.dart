
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Function onToggleVisibility;

  PasswordTextField({
    required this.controller,
    required this.labelText,
    required this.onToggleVisibility,
    required bool obscureText,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: TextField(
        controller: widget.controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
                widget.onToggleVisibility();
              });
            },
            child: Icon(
              obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
              size: 17,
            ),
          ),
        ),
      ),
    );
  }
}
