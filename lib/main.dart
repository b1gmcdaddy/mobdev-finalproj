import 'package:flutter/material.dart';
import 'package:midterm_b/firebase_options.dart';
import 'package:midterm_b/screen/Home.dart';
import 'package:midterm_b/screen/LoginScreen.dart';
import 'package:midterm_b/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:midterm_b/session/Session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Session storageService = Session();

  var item = await storageService.readData("uid");

  if (item != null) {
    runApp(MaterialApp(
      initialRoute: Home.routeName,
      routes: routes,
    ));
  } else {
    runApp(MaterialApp(
      initialRoute: LoginScreen.routeName,
      routes: routes,
    ));
  }
}
