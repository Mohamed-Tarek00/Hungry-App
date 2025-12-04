import 'package:flutter/material.dart';
import 'package:hungryapp/features/orderHistory/presentation/widgets/order_history_card.dart';

class OrderHistoryList extends StatelessWidget {
  const OrderHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return OrderHistoryCard();
      },
    );
  }
}
