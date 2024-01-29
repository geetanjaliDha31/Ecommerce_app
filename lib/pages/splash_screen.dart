// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/pages/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/theme/splash_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      backgroundColor: AppTheme.whiteColor,
      splashIconSize: 300,
      animationDuration: Duration(
        seconds: 1,
      ),
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            // "/logo.png",
            "assets/logo.png",
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Kit Kart",
            style: SplashTheme.splashText(
              size: 26,
              weight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      nextScreen: OnBoarding(),
    );
  }
}
