import 'package:flutter/material.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'package:hungryapp/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:hungryapp/features/auth/presentation/widgets/register_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SafeArea(child: RegisterViewBody()),
        ),
      ),
    );
  }
}
