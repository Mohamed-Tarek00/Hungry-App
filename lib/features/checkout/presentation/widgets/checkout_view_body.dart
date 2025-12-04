import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/checkout_section.dart';
import 'package:hungryapp/features/checkout/presentation/widgets/order_summary_section.dart';
import 'package:hungryapp/features/checkout/presentation/widgets/payment_method_section.dart';
import 'package:hungryapp/features/checkout/presentation/widgets/success_dialog.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: SvgPicture.asset('assets/icons/back.svg'),
                    ),
                    SizedBox(height: 15.h),
                    Text('Order summary', style: FontStyles.textStyle20),
                    SizedBox(height: 5.h),
                    OrderSummarySection(),
                    SizedBox(height: 15.h),
                    Text('Payment methods', style: FontStyles.textStyle20),
                    SizedBox(height: 5.h),
                    PaymentMethodSection(),
                    Spacer(),
                    CheckoutSection(
                      ontap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return SuccessDialog();
                        },
                      ),
                      buttonTitle: 'Pay Now',
                      price: '18.9',
                      text: 'Total Price',
                      textStyle: FontStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
