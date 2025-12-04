import 'package:flutter/material.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/features/auth/presentation/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(child: RegisterViewBody()),
      ),
    );
  }
}
