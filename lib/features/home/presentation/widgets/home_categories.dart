import 'package:flutter/material.dart';
import 'package:hungryapp/features/home/presentation/widgets/category_item.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  final List<String> categoriesInfo = ['All', 'Combos', 'Sliders', 'Classic'];
  int curentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: List.generate(categoriesInfo.length, (index) {
            final category = categoriesInfo[index];
            return CategoryItem(
              onTap: () {
                setState(() {
                  curentIndex = index;
                });
              },
              text: category,
              isSelected: curentIndex == index,
            );
          }),
        ),
      ),
    );
  }
}
