import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/features/checkout/presentation/widgets/payment_card.dart';

class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  String selectedMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentCard(
          logo: 'assets/icons/dollar.png',
          value: 'Cash',
          onTap: () => setState(() {
            selectedMethod = 'Cash';
          }),
          onChanged: (value) {
            setState(() {
              selectedMethod = value!;
            });
          },
          selectedmethod: selectedMethod,
        ),
        PaymentCard(
          logo: 'assets/icons/visa.png',
          cardcolor: const Color.fromARGB(255, 4, 40, 95),
          paymentwidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Debit card',
                style: FontStyles.textStyle14.copyWith(color: Colors.white),
              ),
              Text(
                '3566 **** **** 0505',
                style: FontStyles.textStyle14.copyWith(
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          value: 'Visa',
          onTap: () => setState(() {
            selectedMethod = 'Visa';
          }),
          onChanged: (value) {
            setState(() {
              selectedMethod = value!;
            });
          },
          selectedmethod: selectedMethod,
        ),
        SizedBox(height: 5.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xffEF2A39),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  CupertinoIcons.check_mark,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                'Save card details for future payments',
                style: FontStyles.textStyle14.copyWith(
                  color: Color(0xff808080),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
