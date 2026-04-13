import 'package:flutter/material.dart';
import'package:market_ecommerceapp/core/theme/custome_theme/button_theme.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: TButtonTheme.backgroundColor,
        minimumSize: Size(double.infinity, TButtonTheme.height),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TButtonTheme.borderRadius),
        ),
      ),
      child: Text(
        text,
        style: TButtonTheme.textStyle,
      ),
    );
  }
}