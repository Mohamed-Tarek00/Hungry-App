import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/widgets/custom_textfield.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.search});
  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Material(
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
        child: CustomTextfield(
          hintText: 'Search',
          controller: search,
          preIcon: Icon(
            CupertinoIcons.search,
            color: kSecondaryColor,
            size: 35,
          ),
        ),
      ),
    );
  }
}
