import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market_ecommerceapp/core/theme/custome_theme/product_card.dart';

class ProductCardAsset extends StatelessWidget {
  const ProductCardAsset({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.rating,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  final String imagePath;
  final String name;
  final double price;
  final double rating;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: TProductCardTheme.backgroundColor,
        borderRadius: TProductCardTheme.borderRadius,
        boxShadow: TProductCardTheme.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: imagePath.startsWith("http")
                    ? Image.network(
                  imagePath,
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  imagePath,
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // ❤️ زرار المفضلة
              Positioned(
                top: 8.h,
                right: 8.w,
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.black,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, size: 16.sp, color: Colors.orange),
                  SizedBox(width: 4.w),
                  Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 12.sp),
              ),
            ],
          ),

          SizedBox(height: 6.h),

          Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}