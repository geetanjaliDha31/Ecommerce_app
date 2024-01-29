import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashTheme {
  static TextStyle splashText({
    required double size,
    required FontWeight weight,
    FontStyle style = FontStyle.normal,
    Color color = Colors.black,
    double letterSpacing = 1.0,
    bool isShadow = false,
  }) {
    return GoogleFonts.audiowide(
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
