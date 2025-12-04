import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/features/product_details/presentation/widgets/custom_slider.dart';

class ProductCustomizationSection extends StatelessWidget {
  const ProductCustomizationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/sandwitcd_details.png', width: 120.w),
        SizedBox(width: 40.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDescription(),
              SizedBox(height: 15.h),
              Text(
                'Spicy',
                style: FontStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15.h),
              CustomSlider(),
              SizedBox(height: 5.h),
              Row(children: [Text('🥶'), Spacer(), Text('🌶️')]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Customize',
            style: FontStyles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' Your Burger\n',
            style: FontStyles.textStyle14.copyWith(fontWeight: FontWeight.w100),
          ),
          TextSpan(
            text: ' to Your Tastes. Ultimate \nExperience',
            style: FontStyles.textStyle14.copyWith(fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
