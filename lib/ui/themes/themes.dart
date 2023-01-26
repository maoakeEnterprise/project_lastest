import 'package:flutter/material.dart';

class CustomThemes{
  static TextStyle errorStyle= const TextStyle(fontSize: 22, color: Colors.red);

  static List<ThemeData> themes=[
    ThemeData(
        primarySwatch: Colors.teal
    ),
    ThemeData(
        primarySwatch: Colors.deepOrange
    ),
    ThemeData(
        primarySwatch: Colors.blue
    ),
  ];
}