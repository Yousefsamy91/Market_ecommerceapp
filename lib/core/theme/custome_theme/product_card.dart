import 'package:flutter/material.dart';

class TProductCardTheme {
  TProductCardTheme._();

  static const Color backgroundColor = Colors.white;

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      color: Colors.black.withOpacity(0.1),
      offset: const Offset(0, 4),
    ),
  ];

  static const Color favoriteBg = Colors.white;
  static const Color favoriteColor = Colors.red;

  static const Color ratingIconColor = Colors.black;
  static const TextStyle ratingTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle priceTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle nameTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}