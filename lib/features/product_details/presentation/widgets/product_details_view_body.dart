import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/checkout_section.dart';
import 'package:hungryapp/features/product_details/presentation/widgets/product_customization_section.dart';
import 'package:hungryapp/features/product_details/presentation/widgets/topping_list.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: SvgPicture.asset('assets/icons/back.svg'),
            ),
            SizedBox(height: 25.h),
            const ProductCustomizationSection(),
            SizedBox(height: 20.h),
            Text('Toppings', style: FontStyles.textStyle18),
            SizedBox(height: 10.h),
            FoodOptionList(),
            SizedBox(height: 30.h),
            Text('Side options', style: FontStyles.textStyle18),
            SizedBox(height: 10.h),
            FoodOptionList(),
            SizedBox(height: 30.h),
            CheckoutSection(buttonTitle: 'Add To Cart', price: '18.19'),
          ],
        ),
      ),
    );
  }
}
