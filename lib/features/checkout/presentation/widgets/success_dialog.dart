import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 150.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/icons/check.png', width: 40.w),
          ),
          SizedBox(height: 5.h),

          Text('Success !', style: FontStyles.textStyle30),
          SizedBox(height: 5.h),
          Text(
            textAlign: TextAlign.center,
            'Your payment was successful.\nA receipt for this purchase has \nbeen sent to your email.',
            style: FontStyles.textStyle14.copyWith(color: Colors.grey.shade500),
          ),
          SizedBox(height: 15.h),

          CustomButton(
            title: 'Go Back',
            textStyle: FontStyles.textStyle18.copyWith(color: Colors.white),
            width: 210.w,
            height: 55.h,
            ontap: () => context.pop(),
          ),
        ],
      ),
    );
  }
}
