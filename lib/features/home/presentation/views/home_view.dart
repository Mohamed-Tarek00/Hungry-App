import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'package:hungryapp/features/home/presentation/cubits/Categories_cubit/categories_cubit.dart';
import 'package:hungryapp/features/home/presentation/cubits/Products_Cubit/products_cubit.dart';
import 'package:hungryapp/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductCubit>()..getProducts()),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..getCategories(),
        ),
      ],
      child: Scaffold(
        backgroundColor: kScaffoldcolor,
        body: SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
