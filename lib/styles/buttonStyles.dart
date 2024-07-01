import 'package:flutter/material.dart';
import 'package:test_project/styles/colors.dart';

ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: turquoise,
  padding: const EdgeInsets.symmetric(
    horizontal: 10.0,
    vertical: 15.0,
  ),
  overlayColor: darkTurquoise,
);

const primaryButtonTextStyle = TextStyle(
  color: white,
  fontFamily: 'OpenSans',
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

final secondaryButtonStyle = ElevatedButton.styleFrom();
