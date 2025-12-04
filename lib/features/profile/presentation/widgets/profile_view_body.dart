import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/validator.dart';
import 'package:hungryapp/features/profile/presentation/widgets/payment_method_card.dart';
import 'package:hungryapp/features/profile/presentation/widgets/profile_appbar.dart';
import 'package:hungryapp/features/profile/presentation/widgets/profile_button_section.dart';
import 'package:hungryapp/features/profile/presentation/widgets/profile_image.dart';
import 'package:hungryapp/features/profile/presentation/widgets/profile_text_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileAppbar(),
              SizedBox(height: 10.h),
              const ProfileImage(),
              SizedBox(height: 15.h),
              ProfileTextField(
                labeltext: 'Name',
                controller: name,
                validator: Validator.nameValidator,
              ),
              ProfileTextField(
                labeltext: 'Email',
                controller: email,
                validator: Validator.emailValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              ProfileTextField(
                labeltext: 'Phone',
                controller: phone,
                validator: Validator.phoneValidator,
                keyboardType: TextInputType.phone,
              ),
              ProfileTextField(
                labeltext: 'Password',
                controller: password,
                validator: Validator.passwordValidator,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 5.h),
              Divider(indent: 20.w, endIndent: 20.w),
              SizedBox(height: 5.h),
              const PaymentMethodCard(),
              SizedBox(height: 25.h),
              const ProfileButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
