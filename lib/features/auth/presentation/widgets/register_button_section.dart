import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/utils/app_preferences.dart';
import 'package:hungryapp/core/utils/service_locator.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';
import 'package:hungryapp/core/widgets/custom_loading_indicator.dart';
import 'package:hungryapp/core/widgets/failuer_snackbar.dart';
import 'package:hungryapp/features/auth/domain/entity/register_request_entity.dart';
import 'package:hungryapp/features/auth/presentation/cubits/register_cubit/register_cubit.dart';

class RegisterButtonSection extends StatelessWidget {
  const RegisterButtonSection({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.formKey,
  });
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          final response = state.response;
          final cache = getIt<AppPreferences>();
          cache.saveUserData(user: response);
          context.go(AppRouterNames.root);
        }

        if (state is RegisterFailuer) {
          SnackBarHelper.showFailure(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return CustomLoadingIndicator();
        }

        return CustomButton(
          ontap: () {
            if (formKey.currentState!.validate()) {
              final registerEntity = RegisterRequestEntity(
                name: name.text.trim(),
                email: email.text.trim(),
                phone: phone.text.trim(),
                password: password.text.trim(),
              );

              context.read<RegisterCubit>().register(registerEntity);
            }
          },
          title: 'SIGNUP',
          color: Colors.white,
        );
      },
    );
  }
}
