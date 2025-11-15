import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();
  static TextTheme textTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    bodyLarge: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Poppins'),
    bodySmall: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
  );
}
