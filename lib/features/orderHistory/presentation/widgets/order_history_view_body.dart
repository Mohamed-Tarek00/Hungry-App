import 'package:flutter/material.dart';
import 'package:hungryapp/features/orderHistory/presentation/widgets/order_history_list.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: SingleChildScrollView(
        child: Column(children: [OrderHistoryList()]),
      ),
    );
  }
}
