import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  fontFamily: "Inter",
  scaffoldBackgroundColor: const Color(0xFF131313),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF131313),

      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        elevation:0,
        selectedLabelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Inter"),
        unselectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 28
        )
    ),
  textTheme: const TextTheme(
    labelLarge: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Inter"),
    bodyLarge: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontFamily: "Inter"),
    labelSmall: TextStyle(color: Colors.white,fontWeight: FontWeight.normal,fontFamily: "Inter"),
  ),
  useMaterial3: true

);