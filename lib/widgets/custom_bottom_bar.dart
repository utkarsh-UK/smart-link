import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:smart_link/core/colors.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 15.0,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primaryDarkColor,
            ),
            child: const Icon(FontAwesome.home, size: 30.0, color: Colors.white70),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: borderColor,
            ),
            child: const Icon(
              FontAwesome.plus_circled,
              size: 30.0,
              color: Colors.white70,
            ),
          ),
          const Icon(
            Icons.grid_view_outlined,
            size: 25.0,
            color: Colors.white70,
          )
        ],
      ),
    );
  }
}
