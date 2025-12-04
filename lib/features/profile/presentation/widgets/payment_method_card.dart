import 'package:flutter/material.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/features/checkout/presentation/widgets/payment_card.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentCard(
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
            style: FontStyles.textStyle14.copyWith(color: Colors.grey.shade400),
          ),
        ],
      ),
      value: 'Visa',
      onChanged: (v) {},
    );
  }
}
