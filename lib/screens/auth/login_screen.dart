import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/error_snackbar.dart';
import 'package:test_project/components/round_button.dart';
import 'package:test_project/styles/buttonStyles.dart';
import 'package:test_project/styles/colors.dart';
import 'package:test_project/styles/formStyles.dart';
import 'package:test_project/styles/gradients.dart';
import 'package:test_project/styles/textStyles.dart';

import '../../navigation_stacks/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: veryDarkTurquoise,
      body: Container(
        decoration: BoxDecoration(
          gradient: backgroundRadialGradient(
            center: Alignment.topCenter,
            transform: const GradientRotation(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 20.0,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: headerStyle,
                  ),
                  TextFormField(
                    decoration: textFormFieldInputDecoration(
                      hintText: "E-mail",
                      prefixIconWidget: const Icon(Icons.email_rounded),
                    ),
                    controller: _emailController,
                    style: textFormFieldTextStyle,
                    cursorColor: formCursorColor,
                  ),
                  TextFormField(
                    decoration: textFormFieldInputDecoration(
                      hintText: "Password",
                      prefixIconWidget: const Icon(Icons.lock),
                      suffixIconWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    controller: _passwordController,
                    style: textFormFieldTextStyle,
                    cursorColor: formCursorColor,
                    obscureText: !_showPassword,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          //unfocus keyboard
                          FocusScope.of(context).unfocus();
                          loginFunction(context, _emailController.value.text,
                              _passwordController.value.text);
                        },
                        style: primaryButtonStyle,
                        child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Log in",
                            style: primaryButtonTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, 'signup');
                        },
                        child: const Text(
                          "Sign up",
                          style: secondaryButtonTextStyle,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: light,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: darkTurquoise,
                              fontSize: 15.0,
                              fontFamily: 'Sf Pro Display',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RoundIconButton(
                    onPressed: () {
                      log("button pressed");
                    },
                    icon: Icons.g_mobiledata,
                    backgroundColor: light,
                    iconColor: darkTurquoise,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginFunction(
      BuildContext context, String emailText, String passwordText) async {
    // input validations
    if (emailText == "") {
      showErrorSnackBar(
        context,
        "Please enter an email address.",
      );
      return;
    } else if (passwordText == "") {
      showErrorSnackBar(
        context,
        "Please enter a password.",
      );
      return;
    }
    // login try catch
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("user not found");
        showErrorSnackBar(
          context,
          "No user found with that email.",
        );
        return;
      } else if (e.code == 'wrong-password') {
        log("incorrect password");
        showErrorSnackBar(
          context,
          "Password is incorrect.",
        );
        return;
      } else if (e.code == 'invalid-credential') {
        log("invalid credentials");
        showErrorSnackBar(
          context,
          "Incorrect email or password.",
        );
        return;
      } else {
        log(e.code);
        return;
      }
    } catch (e) {
      log(e.toString());
      showErrorSnackBar(
        context,
        e.toString(),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
