import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungryapp/core/constant.dart';

class FoodOptionCard extends StatelessWidget {
  const FoodOptionCard({
    super.key,
    required this.image,
    required this.title,
    this.iconButtonColor,
    this.onTap,
  });
  final String image;
  final String title;
  final Color? iconButtonColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      width: 95.w,
      height: 120.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // bottom section
          Positioned(
            bottom: 25,
            child: Container(
              width: 95.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: iconButtonColor ?? Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(image),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // image
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Container(
              width: 95.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/tomato.png',
                  height: 45.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
