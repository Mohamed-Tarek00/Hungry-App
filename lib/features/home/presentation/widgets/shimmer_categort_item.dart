import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryItem extends StatelessWidget {
  const ShimmerCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1200),
        child: Container(
          width: 80.w, // تقريبا نفس حجم النص
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}
