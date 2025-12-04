import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';

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
    return CustomButton(
      ontap: () {
        context.go(AppRouterNames.root);
        // if (!formKey.currentState!.validate()) {
        //   return;
        // } else {}
      },
      title: 'SIGNUP',
      color: Colors.white,
    );
  }
}
