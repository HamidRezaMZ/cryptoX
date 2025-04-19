import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: "Inter",
  scaffoldBackgroundColor: const Color(0xffFFFFF0),
    appBarTheme: const AppBarTheme(
        backgroundColor:Color(0xffFFFFF0)
    ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      selectedLabelStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily: "Inter"),
      unselectedIconTheme: IconThemeData(color: Colors.black, size: 28)),
  textTheme: const TextTheme(
    labelLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontFamily: "Inter"),
    bodyLarge: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontFamily: "Inter"),
    labelSmall: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontFamily: "Inter"),

  ),
    useMaterial3: true

);
