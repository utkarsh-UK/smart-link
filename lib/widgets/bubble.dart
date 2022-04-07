import 'package:flutter/material.dart';
import 'package:smart_link/core/colors.dart';

enum BubbleSize {
  small,
  normal,
}

class Bubble extends StatelessWidget {
  final IconData icon;
  final BubbleSize size;

  const Bubble({Key? key, required this.icon, this.size = BubbleSize.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bubblePadding = size == BubbleSize.normal ? 15.0 : 12.0;

    return Container(
      padding: EdgeInsets.all(bubblePadding),
      decoration: BoxDecoration(
        color: borderColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: const Offset(2, 4),
            blurRadius: 6.0,
            spreadRadius: 3.0,
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.95),
          width: 5.0,
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: bubblePadding + 5.0,
      ),
    );
  }
}
