import 'package:ecommerce_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double scale;
  const Loader({super.key, this.scale=1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: const CircularProgressIndicator(
        color: AppTheme.primaryColor,
        semanticsLabel: "Circular Progress Bar",
      ),
    );
  }
}
