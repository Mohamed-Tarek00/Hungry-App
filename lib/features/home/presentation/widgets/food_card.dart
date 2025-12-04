import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/sanswitch.png',
                height: 130.h,
                width: 170.w,
              ),
              Text('Cheeseburger', style: FontStyles.textStyle16),
              Text(
                overflow: TextOverflow.ellipsis,
                'Wendy\'s Burger',
                style: FontStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icons/star.svg'),
                  SizedBox(width: 5.w),
                  Text('4.9', style: FontStyles.textStyle16),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.heart_fill, color: kPrimaryColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
