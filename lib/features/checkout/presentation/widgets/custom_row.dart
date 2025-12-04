import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hungryapp/core/utils/font_styles.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.title,
    required this.price,
    this.titlestyle,
    this.pricestyle,
    this.leftwidget,
    this.rightwidget,
  });
  final String title;
  final String price;
  final TextStyle? titlestyle;
  final TextStyle? pricestyle;
  final Widget? leftwidget;
  final Widget? rightwidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftwidget ??
              Text(
                title,
                style:
                    titlestyle ??
                    FontStyles.textStyle18.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7D7D7D),
                    ),
              ),
          rightwidget ??
              Text(
                '\$$price',
                style:
                    pricestyle ??
                    GoogleFonts.reemKufiInk(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff7D7D7D),
                      fontSize: 18,
                    ),
              ),
        ],
      ),
    );
  }
}
