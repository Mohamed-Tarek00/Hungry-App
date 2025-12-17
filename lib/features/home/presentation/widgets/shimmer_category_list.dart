import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/features/home/presentation/widgets/shimmer_categort_item.dart';

class ShimmerCategoryList extends StatelessWidget {
  const ShimmerCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const ShimmerCategoryItem();
        },
      ),
    );
  }
}
