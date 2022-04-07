import 'package:flutter/material.dart';
import 'package:smart_link/core/colors.dart';

class GradientBackgroud extends StatelessWidget {
  final Widget child;

  const GradientBackgroud({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.45, 0.7],
          tileMode: TileMode.repeated,
          colors: [secondaryColor, Colors.grey.withOpacity(0.4)],
        ),
      ),
      child: child,
    );
  }
}
