import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  primarySwatch: Colors.blue, // Primary color
  primaryColor: Color.fromARGB(255, 4, 22, 52),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16.0),
  ),
);
