import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff29384D);
  static const Color beige = Color(0xffFFF1D4);
  static const Color semiWhite = Color(0xffE2F4F6);
  static const Color red = Color(0xffF93E3E);
  static ThemeData dark = ThemeData();
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: primary,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: beige,
      foregroundColor: primary
    ),
    appBarTheme: AppBarTheme(
      leadingWidth: 120,
      
      backgroundColor: primary,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: beige,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: beige,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: beige,
        foregroundColor: primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      )
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      
      hintStyle: TextStyle(
                fontSize: 16,
        fontWeight: FontWeight.w400,
        color:semiWhite ,
      ),
      filled: true,
      fillColor: primary,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1,color: beige)
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1,color: beige)
      ),
    )
  );
}
