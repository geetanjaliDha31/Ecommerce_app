// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/authentication/sign_in.dart';
import 'package:ecommerce_app/models/onboarding_model.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<OnboardingModel> screens = [];

  void getOnboardingInfo() {
    screens = OnboardingModel.onboardingScreens();
  }

  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getOnboardingInfo();

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              controller: _pageController,
              itemCount: screens.length,
              itemBuilder: (_, index) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 13, vertical: height / 8),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        screens[index].image,
                        height: 300,
                      ),
                      Text(
                        screens[index].title,
                        style: AppTheme.appText(
                          size: 24,
                          weight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        screens[index].description,
                        style: AppTheme.appText(
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              screens.length,
              (index) => buildDot(index, context),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppTheme.buttonShadow,
            ),
            margin: EdgeInsets.all(40),
            child: TextButton(
              onPressed: () {
                if (currentIndex == screens.length - 1) {
                  nextScreen(context, SignIn());
                }
                _pageController.nextPage(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Text(
                currentIndex == screens.length - 1
                    ? "Let's Get Started"
                    : "Next",
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
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 30 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
