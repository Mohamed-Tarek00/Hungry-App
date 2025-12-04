import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'package:hungryapp/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:hungryapp/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: SafeArea(child: const LoginViewBody()),
        ),
      ),
    );
  }
}
