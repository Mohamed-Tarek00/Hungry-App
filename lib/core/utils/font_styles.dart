import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryapp/core/constant.dart';

abstract class FontStyles {
  static final TextStyle splashTextStyle = GoogleFonts.luckiestGuy(
    fontSize: 60.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static final TextStyle priceTextStyle = GoogleFonts.reemKufiInk(
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static final TextStyle appBarTextStyle = GoogleFonts.luckiestGuy(
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
    color: kPrimaryColor,
  );
  static final TextStyle textStyle30 = GoogleFonts.poppins(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    color: kPrimaryColor,
  );
  static final TextStyle textStyle12 = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: kSecondaryColor,
  );
  static final TextStyle textStyle14 = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kSecondaryColor,
  );

  static final TextStyle textStyle16 = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: kSecondaryColor,
  );
  static final TextStyle textStyle18 = GoogleFonts.roboto(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: kSecondaryColor,
  );
  static final TextStyle textStyle20 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: kSecondaryColor,
  );
  static final TextStyle textStyle20roboto = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
