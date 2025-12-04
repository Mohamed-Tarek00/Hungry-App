import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({
    super.key,
    required this.buttonTitle,
    required this.price,
    this.text,
    this.textStyle,
    this.ontap,
  });
  final String buttonTitle;
  final String price;
  final String? text;
  final TextStyle? textStyle;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text ?? 'Total', style: textStyle ?? FontStyles.textStyle18),
            Text('\$$price', style: FontStyles.priceTextStyle),
          ],
        ),
        CustomButton(
          ontap: ontap,
          title: buttonTitle,
          textStyle: FontStyles.textStyle18.copyWith(color: Colors.white),
          width: 170.w,
          height: 55.h,
        ),
      ],
    );
  }
}
