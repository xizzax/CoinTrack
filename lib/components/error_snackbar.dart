import 'package:flutter/material.dart';
import 'package:test_project/styles/colors.dart';

void showErrorSnackBar(context, String errorText) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      content: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Error",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16.0,
                color: white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              errorText,
              style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14.0,
                color: white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
}
