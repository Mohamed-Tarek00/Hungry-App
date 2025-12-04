import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/utils/app_preferences.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';
import 'package:hungryapp/core/widgets/custom_loading_indicator.dart';
import 'package:hungryapp/core/widgets/failuer_snackbar.dart';
import 'package:hungryapp/features/auth/domain/entity/login_request_entity.dart';
import 'package:hungryapp/features/auth/presentation/cubits/login_cubit/login_cubit.dart';

class LoginButtonSection extends StatelessWidget {
  const LoginButtonSection({
    super.key,
    required this.email,
    required this.password,
    required this.formkey,
  });
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formkey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          final user = state.response;
          final cache = getIt<AppPreferences>();
          cache.saveUserData(user: user);
          context.go(AppRouterNames.root);
        } else if (state is LoginFailuer) {
          SnackBarHelper.showFailure(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return CustomLoadingIndicator();
        }
        return CustomButton(
          ontap: () {
            if (formkey.currentState!.validate()) {
              final loginEntity = LoginRequestEntity(
                email: email.text.trim(),
                password: password.text.trim(),
              );
              context.read<LoginCubit>().login(loginEntity);
            } else {}
          },
          title: 'LOGIN',
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        );
      },
    );
  }
}
