import 'package:flutter/material.dart';
import 'package:midterm_b/screen/Dashboard.dart';
import 'package:midterm_b/screen/ForgotPassword.dart';
import 'package:midterm_b/screen/Registration.dart';
import 'package:midterm_b/screen/LoginScreen.dart';
import 'package:midterm_b/screen/Home.dart';
import 'package:midterm_b/screen/Settings.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Registration.routeName: (BuildContext context) => Registration(),
  ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
  Home.routeName: (BuildContext context) => Home(),
  Settings.routeName: (BuildContext context) => Settings()
};
