import 'package:flutter/material.dart';

class CategoryCardTheme {

  static const Color primaryColor = Color(0xFF3F80FF);
  static const Color lightBlue = Color(0xFFDCEEFF);

  static BoxDecoration categoryCardDecoration = BoxDecoration(
    color: lightBlue,
    borderRadius: BorderRadius.all(Radius.circular(12)),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 4,
        offset: Offset(2, 2),
      ),
    ],
  );
}