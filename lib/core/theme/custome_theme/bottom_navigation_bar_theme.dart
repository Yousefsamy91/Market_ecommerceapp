import 'package:flutter/material.dart';

class ThemeBottomNavigationBar {

  static const Color primaryColor = Color(0xFF3F80FF);
  static const Color backgroundColor = Colors.white;
  static const Color iconColor = Colors.grey;
  static const Color activeIconColor = primaryColor;

  static const TextStyle labelStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );

  static BottomNavigationBarThemeData bottomNavBarTheme() {
    return const BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      selectedItemColor: activeIconColor,
      unselectedItemColor: iconColor,
      showUnselectedLabels: true,
      selectedLabelStyle: labelStyle,
      unselectedLabelStyle: labelStyle,
      type: BottomNavigationBarType.fixed,
    );
  }
}