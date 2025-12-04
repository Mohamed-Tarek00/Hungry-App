import 'package:flutter/material.dart';
import 'package:hungryapp/features/product_details/presentation/widgets/topping_item.dart';

class FoodOptionList extends StatelessWidget {
  const FoodOptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return FoodOptionCard(image: 'assets/icons/add.svg', title: 'Tomato');
        }),
      ),
    );
  }
}
