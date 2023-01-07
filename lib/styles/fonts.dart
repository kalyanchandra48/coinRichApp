import 'package:coinrich/styles/colors.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    required double letterSpacing,
    double height = 1.2,
    required TextDecoration decoration,
  }) {
    return TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static final normalText = getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );

  static final appBarHeader = getAppFont(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
  static final smalltitle = getAppFont(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.pieColor,
    letterSpacing: 0,
    decoration: TextDecoration.none,
  );
}
