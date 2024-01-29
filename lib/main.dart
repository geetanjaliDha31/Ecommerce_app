// ignore_for_file: prefer_const_constructors, annotate_overrides, unused_field, prefer_const_literals_to_create_immutables, unused_import

import 'package:ecommerce_app/authentication/otp.dart';
import 'package:ecommerce_app/authentication/phone_auth.dart';
import 'package:ecommerce_app/authentication/sign_in.dart';
import 'package:ecommerce_app/authentication/sign_up.dart';
import 'package:ecommerce_app/pages/add_to_cart.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/onboarding_screen.dart';
import 'package:ecommerce_app/pages/profile.dart';
import 'package:ecommerce_app/pages/splash_screen.dart';
import 'package:ecommerce_app/shared/constants.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/theme/splash_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce_app/helper/helperFun.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: Constants.apiKey,
        authDomain: Constants.authDomain,
        projectId: Constants.projectId,
        storageBucket: Constants.storageBucket,
        messagingSenderId: Constants.messagingSenderId,
        appId: Constants.appId,
        measurementId: Constants.measurementId,
      ),
    );
  }
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    helperFun.getUserLoggedInStatus2().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Kit Kart",
      // home: Home(),
      home: _isSignedIn ? Home() : SplashScreen(),
    );
  }
}
