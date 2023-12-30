import 'package:flutter/material.dart';
import 'package:mobdev_finalproj/screen/Dashboard.dart';
import 'package:mobdev_finalproj/screen/ForgotPassword.dart';
import 'package:mobdev_finalproj/screen/Registration.dart';
import 'package:mobdev_finalproj/screen/LoginScreen.dart';
import 'package:mobdev_finalproj/screen/Home.dart';
import 'package:mobdev_finalproj/screen/Settings.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (BuildContext context) => LoginScreen(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
  Registration.routeName: (BuildContext context) => Registration(),
  ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
  Home.routeName: (BuildContext context) => Home(),
  Settings.routeName: (BuildContext context) => Settings()
};
