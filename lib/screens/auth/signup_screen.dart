import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_project/components/error_snackbar.dart';
import 'package:test_project/components/round_button.dart';
import 'package:test_project/navigation_stacks/home_screen.dart';
import 'package:test_project/styles/buttonStyles.dart';
import 'package:test_project/styles/colors.dart';
import 'package:test_project/styles/formStyles.dart';
import 'package:test_project/styles/gradients.dart';
import 'package:test_project/styles/textStyles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
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
                    "Sign Up",
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
                  TextFormField(
                    decoration: textFormFieldInputDecoration(
                      hintText: "Confirm Password",
                      prefixIconWidget: const Icon(Icons.lock),
                      suffixIconWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            _showConfirmPassword = !_showConfirmPassword;
                          });
                        },
                        icon: Icon(_showConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    controller: _confirmPasswordController,
                    style: textFormFieldTextStyle,
                    cursorColor: formCursorColor,
                    obscureText: !_showConfirmPassword,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          //unfocus keyboard
                          FocusScope.of(context).unfocus();

                          // input checks
                          if (_passwordController.value.text !=
                              _confirmPasswordController.value.text) {
                            showErrorSnackBar(
                              context,
                              "Passwords do not match.",
                            );
                            return;
                          } else if (_emailController.value.text == "") {
                            showErrorSnackBar(
                              context,
                              "Please enter an email address.",
                            );
                            return;
                          } else if (_passwordController.value.text == "" ||
                              _confirmPasswordController.value.text == "") {
                            showErrorSnackBar(
                              context,
                              "Please enter a password.",
                            );
                            return;
                          }

                          //  firebase sign up
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _emailController.value.text,
                              password: _passwordController.value.text,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              log("weak password");
                              showErrorSnackBar(
                                context,
                                "Password is too weak.",
                              );
                              return;
                            } else if (e.code == 'email-already-in-use') {
                              log("email used");
                              showErrorSnackBar(
                                context,
                                "An account with that email already exists.",
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
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        style: primaryButtonStyle,
                        child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Sign Up",
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
                          Navigator.pushReplacementNamed(context, 'login');
                        },
                        child: const Text(
                          "Log in",
                          style: secondaryButtonTextStyle,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                    child: Row(children: <Widget>[
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
                    ]),
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
}
