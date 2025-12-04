import 'package:flutter/material.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/features/orderHistory/presentation/widgets/order_history_view_body.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldcolor,
      body: SafeArea(child: OrderHistoryViewBody()),
    );
  }
}
