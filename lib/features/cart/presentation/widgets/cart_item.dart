import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/custom_button.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;
  void onAdd() {
    setState(() {
      quantity++;
    });
  }

  void onMin() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.r),
      ),
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/sanswitch.png',
                  width: 110.w,
                  height: 100.h,
                ),
                Text(
                  'Hamburger',
                  style: FontStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Veggie Burger',
                  style: FontStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: onAdd,
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/plus.svg',
                          width: 10.w,
                          height: 10.h,
                        ),
                      ),
                    ),

                    SizedBox(width: 15.w),
                    Text(quantity.toString(), style: FontStyles.textStyle18),
                    SizedBox(width: 15.w),
                    GestureDetector(
                      onTap: onMin,
                      child: Container(
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset('assets/icons/minus.svg'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  title: 'Remove',
                  width: 150.w,
                  height: 40.h,
                  borderRadius: BorderRadius.circular(25),
                  textStyle: FontStyles.textStyle18.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
