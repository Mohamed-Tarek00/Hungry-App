import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungryapp/core/constant.dart';
import 'package:hungryapp/core/utils/font_styles.dart';
import 'package:hungryapp/core/widgets/custom_network_image.dart';
import 'package:hungryapp/features/home/domain/entity/product_entity.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({super.key, this.onTap, required this.product});
  final void Function()? onTap;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                imageUrl: product.image,
                width: 120.w,
                height: 120.h,
                fit: BoxFit.contain,
              ),

              Text(product.name, style: FontStyles.textStyle16),
              Text(
                overflow: TextOverflow.ellipsis,
                product.description,
                style: FontStyles.textStyle14.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icons/star.svg'),
                  SizedBox(width: 5.w),
                  Text(
                    product.rating.toString(),
                    style: FontStyles.textStyle16,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.heart_fill, color: kPrimaryColor),
                  ),
                ],
              ),

              Text('\$ ${product.price}', style: FontStyles.textStyle16),
            ],
          ),
        ),
      ),
    );
  }
}
