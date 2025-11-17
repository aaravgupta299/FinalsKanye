import 'package:flutter/material.dart';
//custom theme, just makes buttons and textfields rounded a custom amount and makes the background black
final blackTheme = ThemeData(
  
  useMaterial3: true,
  
  brightness: Brightness.dark, 
  
  
  
  colorScheme: ColorScheme.fromSeed( 
    seedColor: Colors.deepPurple, //color scheme
    brightness: Brightness.dark,
  ),
  
  inputDecorationTheme: InputDecorationTheme( 
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    filled: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData( 
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
);