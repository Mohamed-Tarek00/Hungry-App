import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/features/checkout/presentation/widgets/custom_row.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        children: [
          CustomRow(title: 'Order', price: '16.48'),
          CustomRow(title: 'Taxes', price: '0.3'),
          CustomRow(title: 'Delivery fees', price: '1.5'),
          Divider(),
          SizedBox(height: 10.h),
          CustomRow(
            title: 'Total:',
            titlestyle: FontStyles.textStyle18,
            price: '18.9',
            pricestyle: FontStyles.textStyle18,
          ),
          SizedBox(height: 5.h),
          CustomRow(
            title: 'Estimated delivery time:',
            titlestyle: FontStyles.textStyle14,
            price: '15 - 30 mins',
            pricestyle: FontStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}
