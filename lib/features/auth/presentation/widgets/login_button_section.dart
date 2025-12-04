import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';

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
    return CustomButton(
      ontap: () {
        context.go(AppRouterNames.root);
        // if (!formkey.currentState!.validate()) {
        //   return;
        // } else {}
      },
      title: 'LOGIN',
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    );
  }
}
