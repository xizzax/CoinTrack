import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_project/navigation_stacks/auth_navigator.dart';
import 'package:test_project/navigation_stacks/home_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinTrack - Budget Tracker Mobile App',
      routes: {'/': (context) => const Switcher()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class Switcher extends StatelessWidget {
  const Switcher({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      log("User logged in!");
      return const HomeScreen();
    } else {
      log("User NOT logged in!");
      return const AuthNavigator();
    }
  }
}
