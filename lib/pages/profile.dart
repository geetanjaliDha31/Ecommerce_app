// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_app/authentication/sign_in.dart';
import 'package:ecommerce_app/pages/add_to_cart.dart';
import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/search.dart';
import 'package:ecommerce_app/services/auth_services.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/theme/splash_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 2;
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppTheme.whiteColor,
        foregroundColor: AppTheme.blackColor,
        toolbarHeight: 65,
        centerTitle: true,
        titleTextStyle: SplashTheme.splashText(
          size: 22,
          weight: FontWeight.bold,
          color: AppTheme.blackColor,
          letterSpacing: 4,
        ),
        title: Text(
          "Kit Kart",
        ),
        leading: Image.asset(
          'assets/logo.png',
          // '/logo.png',
          height: 20,
          width: 20,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              onPressed: () {
                nextScreen(context, const Search());
              },
              icon: Icon(
                Icons.search,
                color: AppTheme.blackColor,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: AppTheme.cardShadow,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: AppTheme.primaryColor,
          unselectedItemColor: Colors.grey.shade600,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 29,
                ),
                onPressed: () {
                  nextScreen(context, Home());
                },
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 29,
                ),
                onPressed: () {
                  nextScreen(context, AddToCart());
                },
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: IconButton(
                icon: Icon(
                  Icons.person,
                  size: 29,
                ),
                onPressed: () {
                  nextScreen(context, Profile());
                },
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Hello There !",
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: AppTheme.buttonShadow,
              ),
              margin: EdgeInsets.all(40),
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Sign Out",
                            style: AppTheme.appText(
                                size: 16,
                                weight: FontWeight.w500,
                                color: AppTheme.blackColor),
                          ),
                          content: Text(
                            "Are you sure you want to Sign Out?",
                            style: AppTheme.appText(
                                size: 14,
                                weight: FontWeight.w400,
                                color: AppTheme.blackColor),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: AppTheme.appText(
                                  size: 14,
                                  weight: FontWeight.w500,
                                  color: AppTheme.blackColor,
                                ),
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 130,
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () async {
                                  await authServices.signout();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => const SignIn()),
                                      (route) => false);
                                },
                                child: Text(
                                  "Sign Out",
                                  style: AppTheme.appText(
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  "SIGN OUT",
                  style: AppTheme.appText(
                    size: 18,
                    weight: FontWeight.w600,
                    color: AppTheme.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
