import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobdev_finalproj/models/PrimaryButton.dart';
import 'package:mobdev_finalproj/screen/LoginScreen.dart';

class Settings extends StatefulWidget {
  static const String routeName = "settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 40.0,
                ),
                PrimaryButton(
                    text: "Logout",
                    iconData: FaIcon(FontAwesomeIcons.signOutAlt),
                    onPress: logout),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logout() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
