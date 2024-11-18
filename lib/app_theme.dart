import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Color(0xFF39A552);
  static const Color red = Color(0xFFC91C22);
  static const Color black = Color(0xFF303030);
  static const Color white = Color(0xFFFFFFFF);
  static const Color navy = Color(0xFF4F5A69);
  static const Color gray = Color(0xFF79828B);
  static const Color darkgray = Color(0xFF42505C);
  static const Color lightgray = Color(0xFFA3A3A3);
  static ThemeData lightMode = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          foregroundColor: white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32))),
          backgroundColor: primaryLight,
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w400, color: white)),
      primaryColor: primaryLight,
      textTheme: const TextTheme(
          titleSmall: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w400, color: black),
          titleMedium: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: black),
          titleLarge: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: white)));
}
