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

ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: light,
  padding: const EdgeInsets.symmetric(
    horizontal: 15.0,
    vertical: 10.0,
  ),
  elevation: 0,
  overlayColor: darkTurquoise,
);

const secondaryButtonTextStyle = TextStyle(
  color: turquoise,
  fontFamily: 'OpenSans',
  fontSize: 14.0,
);
