import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:smart_link/core/colors.dart';

class CustomAppBar extends StatelessWidget {
  final bool isHomeScreen;

  const CustomAppBar({Key? key, this.isHomeScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: isHomeScreen
          ? _buildHomeScreenActions()
          : _buildOtherScreenActions(textTheme),
    );
  }

  List<Widget> _buildOtherScreenActions(TextTheme textTheme) {
    return [
      Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: const Icon(
          FontAwesome5.angle_left,
          color: primaryColor,
          size: 30.0,
        ),
      ),
      Text('Preview', style: textTheme.headline3),
      Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: const Icon(
          FontAwesome5.ellipsis_v,
          color: primaryColor,
          size: 30.0,
        ),
      ),
    ];
  }

  List<Widget> _buildHomeScreenActions() {
    return [
      Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: const Icon(
          FontAwesome5.bars,
          color: primaryColor,
          size: 30.0,
        ),
      ),
      const CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage('assets/images/profile_1.png'),
      ),
    ];
  }
}
