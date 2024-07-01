import 'package:flutter/material.dart';
import 'package:test_project/styles/buttonStyles.dart';
import 'package:test_project/styles/colors.dart';
import 'package:test_project/styles/formStyles.dart';
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
    return Scaffold(
        backgroundColor: veryDarkTurquoise,
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFF314941),
                Color(0xFF2c4139),
                Color(0xFF273834),
                Color(0xFF22302d),
                Color(0xFF1d2826),
                veryDarkTurquoise,
              ],
              stops: [
                // 0.1,
                0.25,
                0.35,
                0.5,
                0.6,
                0.75,
                0.9,
              ],
              center: Alignment.topCenter,
              radius: 0.7,
              transform: GradientRotation(0.2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50.0,
              horizontal: 20.0,
            ),
            child: Container(
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
                  ElevatedButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
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
                  ElevatedButton(
                    onPressed: () {},
                    style: secondaryButtonStyle,
                    child: Text("Login Instead"),
                  ),
                  SizedBox(
                    height: 20.0,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade400,
                      )),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Text(
                          "or with",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontFamily: 'Sf Pro Display',
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        color: Colors.grey.shade400,
                      )),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
