import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/widgets/failuer_snackbar.dart';
import 'package:hungryapp/features/home/presentation/cubits/Products_Cubit/products_cubit.dart';
import 'package:hungryapp/features/home/presentation/widgets/food_card.dart';
import 'package:hungryapp/features/home/presentation/widgets/shimmer_food_list.dart';

class FoodGrid extends StatelessWidget {
  const FoodGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsFailuer) {
          return SnackBarHelper.showFailure(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const ShimmerFoodList();
        }
        if (state is ProductsSuccess) {
          final products = state.response;
          return SliverGrid.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .59,
              crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (BuildContext context, int index) {
              return FoodCard(
                onTap: () => context.push(AppRouterNames.productdetailsview),
                product: products[index],
              );
            },
          );
        }
        return const SliverToBoxAdapter(
          child: Center(child: Text('Something Went Wrong')),
        );
      },
    );
  }
}
