import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobdev_finalproj/models/CustomTextFormField.dart';
import 'package:mobdev_finalproj/models/PasswordField.dart';
import 'package:mobdev_finalproj/models/PrimaryButton.dart';
import 'package:mobdev_finalproj/screen/LoginScreen.dart';

class Registration extends StatefulWidget {
  static const String routeName = "registration";
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.0,
                ),
                CustomTextFormField(
                    labelText: "Email",
                    hintText: "Enter a valid email",
                    iconData: Icons.email,
                    controller: emailController),
                SizedBox(
                  height: 20.0,
                ),
                PasswordField(
                    obscureText: obscureText,
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    labelText: "Password",
                    hintText: "Enter your password",
                    controller: passwordController),
                SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                    text: "Sign up",
                    iconData: FaIcon(FontAwesomeIcons.userPlus),
                    onPress: () {
                      signUp(emailController.value.text,
                          passwordController.value.text);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text("Already have an account?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      print("successful registration");
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e);
    }
  }
}
