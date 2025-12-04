import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset('assets/icons/back.svg', color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings, color: Colors.white, size: 28),
        ),
      ],
    );
  }
}
