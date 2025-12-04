import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color,
    required this.title,
    this.textStyle,
    this.ontap,
    this.width,
    this.padding,
    this.height,
    this.child,
    this.borderRadius,
    this.border,
  });
  final Color? color;
  final String title;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final void Function()? ontap;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color ?? kPrimaryColor,
          borderRadius: borderRadius ?? BorderRadius.circular(15.r),
          border: border,
        ),
        child: Center(
          child:
              child ?? Text(title, style: textStyle ?? FontStyles.textStyle18),
        ),
      ),
    );
  }
}
