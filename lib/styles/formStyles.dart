import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration textFormFieldInputDecoration({
  required String hintText,
  required Widget prefixIconWidget,
  Widget? suffixIconWidget,
}) {
  return InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 30.0,
      vertical: 15.0,
    ),
    hintText: hintText,
    hintStyle: const TextStyle(
      fontFamily: 'OpenSans',
      color: darkTurquoise,
      fontSize: 15.0,
    ),
    fillColor: light,
    filled: true,
    labelText: hintText,
    labelStyle: const TextStyle(
      fontFamily: 'OpenSans',
      color: darkTurquoise,
      fontSize: 15.0,
    ),
    prefixIcon: prefixIconWidget,
    prefixIconColor: darkTurquoise,
    suffixIcon: suffixIconWidget,
    suffixIconColor: darkTurquoise,
  );
}

const textFormFieldTextStyle = TextStyle(
  fontFamily: 'OpenSans',
  color: white,
  fontSize: 15.0,
);

const formCursorColor = darkTurquoise;
