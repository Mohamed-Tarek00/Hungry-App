import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/features/home/presentation/widgets/food_card_loading.dart';

class ShimmerFoodList extends StatelessWidget {
  const ShimmerFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: .59,
        crossAxisCount: 2,
        mainAxisSpacing: 30.h,
        crossAxisSpacing: 10.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ShimmerFoodCard();
      },
    );
  }
}
