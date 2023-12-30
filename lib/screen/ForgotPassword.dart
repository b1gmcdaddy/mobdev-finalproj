import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  static const String routeName = "forgotpassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Text("This is the Forgot Password."),
      ),
    );
  }
}
