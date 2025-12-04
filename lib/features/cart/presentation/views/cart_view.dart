import 'package:flutter/material.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldcolor,
      body: SafeArea(child: CartViewBody()),
    );
  }
}
