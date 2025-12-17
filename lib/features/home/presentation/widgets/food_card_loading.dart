import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFoodCard extends StatelessWidget {
  const ShimmerFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 8.h),

            // اسم المنتج
            Container(height: 20.h, width: 140.w, color: Colors.grey[300]),
            SizedBox(height: 4.h),

            // وصف المنتج
            Container(height: 16.h, width: 200.w, color: Colors.grey[300]),
            SizedBox(height: 8.h),

            // صف التقييم و الهيرت
            Row(
              children: [
                Container(
                  height: 16.h,
                  width: 16.w,
                  color: Colors.grey[300],
                ), // نجمة
                SizedBox(width: 6.w),
                Container(
                  height: 16.h,
                  width: 30.w,
                  color: Colors.grey[300],
                ), // تقييم
                const Spacer(),
                Container(
                  height: 28.h,
                  width: 28.w,
                  color: Colors.grey[300],
                ), // هيرت
              ],
            ),
            SizedBox(height: 8.h),

            // السعر
            Container(height: 20.h, width: 80.w, color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }
}
