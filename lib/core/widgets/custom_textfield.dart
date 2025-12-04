import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/constant.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    super.key,
    required this.hintText,
    this.hintStyle,
    required this.controller,
    this.validator,
    this.inputType,
    this.isSecure = false,
    this.preIcon,
    this.padding,
  });

  final String hintText;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool isSecure;
  final Widget? preIcon;
  final EdgeInsets? padding;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(0),
      child: TextFormField(
        obscureText: widget.isSecure ? hidePassword : false,
        keyboardType: widget.inputType ?? TextInputType.name,
        validator: widget.validator,
        controller: widget.controller,
        cursorHeight: 20,
        cursorColor: kSecondaryColor,
        decoration: InputDecoration(
          prefixIcon: widget.preIcon ?? SizedBox.shrink(),
          suffixIcon: widget.isSecure
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                  child: Icon(
                    hidePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: kPrimaryColor,
                  ),
                )
              : const SizedBox.shrink(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: Colors.white,
          filled: true,
          hintText: widget.hintText,
          hintStyle:
              widget.hintStyle ??
              TextStyle(
                color: kSecondaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
