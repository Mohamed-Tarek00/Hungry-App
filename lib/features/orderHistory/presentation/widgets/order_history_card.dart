import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/sanswitch.png', width: 100.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Humberger', style: FontStyles.textStyle16),
                    Text('Qty : x3', style: FontStyles.textStyle14),
                    Text('Price : 20\$', style: FontStyles.textStyle14),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomButton(
              title: 'Order Again',
              textStyle: FontStyles.textStyle18.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
