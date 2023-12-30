import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobdev_finalproj/models/CustomTextFormField.dart';
import 'package:mobdev_finalproj/models/PasswordField.dart';
import 'package:mobdev_finalproj/models/PrimaryButton.dart';
import 'package:mobdev_finalproj/models/StorageItem.dart';
import 'package:mobdev_finalproj/screen/Home.dart';
import 'package:mobdev_finalproj/screen/Registration.dart';
import 'package:mobdev_finalproj/session/Session.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Session session = Session();
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
                    text: "Login",
                    iconData: Icons.login,
                    onPress: () {
                      signIn(context, emailController.value.text,
                          passwordController.value.text);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                PrimaryButton(
                    text: "Login with Google",
                    iconData: Icons.login,
                    onPress: () {}),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text("New to the app?"),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Registration.routeName);
                        },
                        child: Text(
                          "Sign up",
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

  signIn(context, String email, String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var item = StorageItem("uid", credential.user?.uid ?? "");
      await session.saveData(item);
      Navigator.pushReplacementNamed(context, Home.routeName);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
