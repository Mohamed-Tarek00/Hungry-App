import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.text,
    this.onTap,
    required this.isSelected,
  });
  final String text;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: BoxDecoration(
          boxShadow: [
            isSelected
                ? BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                    spreadRadius: 1.5,
                    offset: Offset(0, 4),
                  )
                : BoxShadow(),
          ],
          color: isSelected ? kPrimaryColor : Color(0xffF3F4F6),
          borderRadius: BorderRadius.circular(24),
        ),
        duration: Duration(milliseconds: 350),
        child: Text(
          text,
          style: FontStyles.textStyle16.copyWith(
            color: isSelected ? Colors.white : Color(0xff6A6A6A),
          ),
        ),
      ),
    );
  }
}
