import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.labeltext,
    this.labelwidget,
    this.isPassword,
    this.validator,
    required this.controller,
    this.keyboardType,
  });
  final String labeltext;
  final Widget? labelwidget;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: TextFormField(
        style: FontStyles.textStyle16.copyWith(color: Colors.white),
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: isPassword ?? false,
        cursorColor: Colors.white,
        cursorHeight: 20,
        decoration: InputDecoration(
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                labelwidget ??
                Text(
                  labeltext,
                  style: FontStyles.textStyle14.copyWith(
                    color: Color(0xff808080),
                    fontWeight: FontWeight.w400,
                  ),
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
}
