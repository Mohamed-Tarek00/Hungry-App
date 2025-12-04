import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hungry?', style: FontStyles.appBarTextStyle),
              Text(
                'Hello, Mohamed Tarek',
                style: FontStyles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6A6A6A),
                ),
              ),
            ],
          ),

          CircleAvatar(
            radius: 35.r,
            child: Image.asset('assets/images/profile.png'),
          ),
        ],
      ),
    );
  }
}
