// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/components/loader.dart';
import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function onPress;
  const CustomButton(
      {super.key,
      required this.text,
      this.isLoading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppTheme.buttonShadow,
      ),
      margin: EdgeInsets.all(40),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPress(),
        child: isLoading
            ? Loader()
            : Text(
                text,
                style: AppTheme.appText(
                  size: 18,
                  weight: FontWeight.w600,
                  color: AppTheme.whiteColor,
                ),
              ),
      ),
    );
  }
}
