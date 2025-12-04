import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';

class ProfileButtonSection extends StatelessWidget {
  const ProfileButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            title: '',
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Edit Profile',
                  style: FontStyles.textStyle18.copyWith(color: kPrimaryColor),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset('assets/icons/edit.svg'),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: CustomButton(
            title: '',
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 2.w),
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log out',
                  style: FontStyles.textStyle18.copyWith(color: Colors.white),
                ),
                SizedBox(width: 12.w),
                SvgPicture.asset('assets/icons/sign-out.svg'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
