import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color primaryColor = Color(0xFF017C82);
  static const cardShadow = [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 6,
      spreadRadius: 2,
      offset: Offset(0, 2),
    )
  ];
  static const buttonShadow = [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 3,
      spreadRadius: 2,
      offset: Offset(1, 3),
    )
  ];
  static const textFieldShadow = [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 3,
      spreadRadius: 2,
      offset: Offset(0, 2),
    )
  ];

  static getCardDecoration() {
    return BoxDecoration(
      color: AppTheme.whiteColor,
      boxShadow: cardShadow,
      borderRadius: BorderRadius.circular(25),
    );
  }

  static TextStyle appText({
    required double? size,
    required FontWeight? weight,
    FontStyle style = FontStyle.normal,
    Color color = blackColor,
    double letterSpacing = 1.0,
    bool isShadow = false,
  }) {
    return GoogleFonts.poppins(
        fontSize: size,
        fontWeight: weight,
        // wordSpacing: 1.4,
        fontStyle: style,
        letterSpacing: letterSpacing,
        color: color,
        shadows: isShadow
            ? [
                BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    offset: const Offset(0.1, 0.4),
                    spreadRadius: 3,
                    blurRadius: 2)
              ]
            : null);
  }
}
