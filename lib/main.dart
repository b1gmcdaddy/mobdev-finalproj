import 'package:flutter/material.dart';
import 'package:mobdev_finalproj/firebase_options.dart';
import 'package:mobdev_finalproj/screen/Home.dart';
import 'package:mobdev_finalproj/screen/LoginScreen.dart';
import 'package:mobdev_finalproj/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobdev_finalproj/session/Session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Session storageService = Session();

  var item = await storageService.readData("uid");

  if (item != null) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
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
