import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungryapp/core/constant.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double value = 70;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 5.h,
        inactiveTrackColor: Colors.grey[300],
        activeTrackColor: kPrimaryColor,
        thumbColor: kPrimaryColor,
        overlayColor: Color(0x330B3F1A),
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 10.r,
          disabledThumbRadius: 10.r,
        ),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.r),
      ),
      child: Slider(
        padding: EdgeInsets.zero,
        value: value,
        min: 0,
        max: 100,
        onChanged: (v) => setState(() => value = v),
      ),
    );
  }
}
