import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/utils/validator.dart';
import 'package:hungryapp/core/widgets/custom_textfield.dart';
import 'package:hungryapp/features/auth/presentation/widgets/login_button_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text('Hungry?', style: FontStyles.splashTextStyle),
              Text(
                'Welcome Back, Discover The Fast Food',
                style: FontStyles.textStyle12.copyWith(color: Colors.white),
              ),
              SizedBox(height: 30.h),
              CustomTextfield(
                hintText: 'Email',
                controller: email,
                validator: Validator.emailValidator,
                inputType: TextInputType.emailAddress,
                preIcon: Icon(CupertinoIcons.mail_solid),
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                hintText: 'Password',
                controller: password,
                validator: Validator.passwordValidator,
                inputType: TextInputType.visiblePassword,
                isSecure: true,
                preIcon: Icon(CupertinoIcons.lock_fill),
              ),
              SizedBox(height: 30.h),
              LoginButtonSection(
                email: email,
                password: password,
                formkey: formkey,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t Have Account?',
                    style: FontStyles.textStyle14.copyWith(color: Colors.grey),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () => context.go(AppRouterNames.registerView),
                    child: Text(
                      'SIGNUP',
                      style: FontStyles.textStyle16.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
