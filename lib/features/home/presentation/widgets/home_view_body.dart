import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/features/home/presentation/widgets/food_grid.dart';
import 'package:hungryapp/features/home/presentation/widgets/home_appbar.dart';
import 'package:hungryapp/features/home/presentation/widgets/home_categories.dart';
import 'package:hungryapp/features/home/presentation/widgets/search_field.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const HomeAppbar(),
              SizedBox(height: 15.h),
              SearchField(search: search),
              SizedBox(height: 15.h),
              const HomeCategories(),
              SizedBox(height: 15.h),
            ],
          ),
        ),
        SliverPadding(padding: EdgeInsets.zero, sliver: FoodGrid()),
      ],
    );
  }
}
