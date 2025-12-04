import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/features/cart/presentation/widgets/cart_item.dart';
import 'package:hungryapp/core/widgets/checkout_section.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.zero,
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const CartItem(),
              childCount: 5,
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                CheckoutSection(
                  ontap: () => context.push(AppRouterNames.checkoutview),
                  buttonTitle: 'Checkout',
                  price: '99.19',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}







    // Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
    //   child: SingleChildScrollView(
    //     child: Column(
    //       children: [
    //         SizedBox(height: 15.h),
    //         ListView.builder(
    //           shrinkWrap: true,
    //           physics: NeverScrollableScrollPhysics(),
    //           itemCount: 5,
    //           itemBuilder: (context, index) {
    //             return CartItem();
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );