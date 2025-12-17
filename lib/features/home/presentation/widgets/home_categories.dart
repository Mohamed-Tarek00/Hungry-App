import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/features/home/domain/entity/category_entity.dart';
import 'package:hungryapp/features/home/presentation/cubits/Categories_cubit/categories_cubit.dart';
import 'package:hungryapp/features/home/presentation/cubits/Products_Cubit/products_cubit.dart';
import 'package:hungryapp/features/home/presentation/widgets/category_item.dart';
import 'package:hungryapp/features/home/presentation/widgets/shimmer_category_list.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({super.key});

  @override
  State<HomeCategories> createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  int curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return const ShimmerCategoryList();
        }

        if (state is CategoriesFailuer) {
          return const Center(child: Text('Something Went Wrong'));
        }

        if (state is CategoriesSuccess) {
          final categories = state.response;
          final allCategory = CategoryEntity(id: 0, name: 'All');
          final displayCategories = [allCategory, ...categories];

          return SizedBox(
            height: 50.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: displayCategories.length,
              itemBuilder: (context, index) {
                final category = displayCategories[index];
                return CategoryItem(
                  text: category.name,
                  isSelected: curentIndex == index,
                  onTap: () {
                    setState(() {
                      curentIndex = index;
                      final categoryId = category.id == 0 ? null : category.id;
                      context.read<ProductCubit>().getProducts(
                        categoryId: categoryId,
                      );
                    });
                  },
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
