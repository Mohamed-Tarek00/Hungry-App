import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hungryapp/core/router/app_router_names.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/utils/validator.dart';
import 'package:hungryapp/core/widgets/custom_textfield.dart';
import 'package:hungryapp/features/auth/presentation/widgets/register_button_section.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: SingleChildScrollView(
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
                hintText: 'Name',
                controller: name,
                validator: Validator.nameValidator,
                inputType: TextInputType.text,
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                hintText: 'Phone',
                controller: phone,
                validator: Validator.phoneValidator,
                inputType: TextInputType.phone,
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                hintText: 'Email',
                controller: email,
                validator: Validator.emailValidator,
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              CustomTextfield(
                hintText: 'Password',
                controller: password,
                validator: Validator.passwordValidator,
                inputType: TextInputType.visiblePassword,
                isSecure: true,
              ),
              SizedBox(height: 20.h),
              RegisterButtonSection(
                name: name,
                phone: phone,
                email: email,
                password: password,
                formKey: formKey,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account',
                    style: FontStyles.textStyle14.copyWith(color: Colors.grey),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () => context.go(AppRouterNames.loginView),
                    child: Text(
                      'LOGIN',
                      style: FontStyles.textStyle16.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        decorationThickness: 2,
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
