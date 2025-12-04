import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    super.key,
    required this.logo,
    this.paymentName,
    this.paymentwidget,
    this.cardcolor,
    this.value,
    required this.onChanged,
    this.selectedmethod,
    this.onTap,
  });
  final void Function()? onTap;
  final String? value;
  final String logo;
  final String? paymentName;
  final Widget? paymentwidget;
  final Color? cardcolor;
  final void Function(String?) onChanged;
  final String? selectedmethod;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        elevation: 5,
        color: cardcolor ?? kSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Row(
            children: [
              Image.asset(logo, width: 60.w, height: 60.h),
              Spacer(flex: 1),
              paymentwidget ??
                  Text(
                    paymentName ?? 'Cash on Delivery',
                    style: FontStyles.textStyle20roboto,
                  ),
              Spacer(flex: 3),
              RadioGroup(
                onChanged: onChanged,
                groupValue: selectedmethod,
                child: Radio(value: value, activeColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
