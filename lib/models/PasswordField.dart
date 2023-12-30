import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final bool obscureText;
  final Function onTap;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  PasswordField({
    Key? key,
    required this.obscureText,
    required this.onTap,
    required this.labelText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                onTap();
              },
              child:
                  Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            ),
            prefixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.lock),
            ),
            labelText: labelText,
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.blueAccent, width: 1))));
  }
}
