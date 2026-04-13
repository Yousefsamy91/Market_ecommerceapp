import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class text_field_theme {
  static InputDecorationTheme lightInputDecorationtheme =InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.black,fontSize: 16.sp),
hintStyle: TextStyle(color: Colors.black,fontSize: 16.sp),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      borderSide: BorderSide(color: Colors.lightBlue),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      borderSide: BorderSide(color: Colors.lightBlue),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      borderSide: BorderSide(color: Colors.lightBlue, width: 2),
    ),
  );
}