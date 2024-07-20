import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:test_project/styles/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    log("done pressed");
    Navigator.pushReplacementNamed(context, 'signup');
  }

  Widget _buildImage(String assetName, [double width = 400]) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 25.0,
        ),
        child: Image.asset(
          'lib/assets/onboarding_vectors/$assetName',
          width: width,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w700,
        color: white,
        fontFamily: 'OpenSans',
      ),
      imagePadding: EdgeInsets.fromLTRB(
        10.0,
        30.0,
        10.0,
        0.0,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18.0,
        color: white,
        fontFamily: 'OpenSans',
      ),
      bodyPadding: EdgeInsets.fromLTRB(
        5.0,
        2.0,
        5.0,
        10.0,
      ),
      boxDecoration: BoxDecoration(
        color: veryDarkTurquoise,
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
          center: Alignment.centerRight,
          radius: 0.7,
        ),
      ),

      // imagePadding: EdgeInsets.all(50),
      contentMargin: EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 0.0,
      ),
      pageMargin: EdgeInsets.fromLTRB(
        0.0,
        100.0,
        0.0,
        20.0,
      ),
      imageAlignment: Alignment.bottomCenter,
      bodyAlignment: Alignment.topCenter,
      titlePadding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 0.0,
      ),
      imageFlex: 2,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: veryDarkTurquoise,
      allowImplicitScrolling: true,
      autoScrollDuration: 3500,
      infiniteAutoScroll: false,
      globalHeader: Container(
        child: const Padding(
          padding: EdgeInsets.all(70.0),
          child: Center(
            child: Text(
              "Coin Track",
              style: TextStyle(
                color: white,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Simplicity",
          body: "Manage Your Finances Effortlessly",
          image: _buildImage('1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Insight",
          body: "Understand Your Spending Habits",
          image: _buildImage('2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Control",
          body: "Take Charge of Your Budget",
          image: _buildImage('3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      showNextButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeColor: white,
        color: light,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
      skipStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.transparent,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(turquoise),
      ),
      nextStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.transparent,
        ),
        foregroundColor: WidgetStateProperty.all<Color>(turquoise),
      ),
      doneStyle: ElevatedButton.styleFrom(
        foregroundColor: white,
        backgroundColor: turquoise,
      ),
    );
  }
}
