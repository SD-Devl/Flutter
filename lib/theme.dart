import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get themeData => ThemeData(
    primaryColor: Colors.green.shade50,
    hintColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
      // Add more text styles as needed
      bodyMedium: TextStyle(
        fontSize: 16.0,
        color: Colors.black87,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0,
        color: Colors.grey,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.teal,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
    // Add more theme configurations as needed
  );
}
