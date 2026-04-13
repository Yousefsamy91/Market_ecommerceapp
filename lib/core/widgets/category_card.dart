import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 90.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: Colors.blue,
                width: 1.2.w,
              ),
            ),
            child: Center(
              child: Image.network(
                imageUrl,
                width: 65.w,
                height: 65.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        SizedBox(height: 8.h),

        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp),
        ),
      ],
    );
  }
}