import 'package:flutter/material.dart';
import 'package:smart_link/core/colors.dart';

/// Defines app theme including text themes.
class ApplicationTheme {
  static ThemeData getAppThemeData() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: iconColor),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: primaryTextColor,
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          headline2: const TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          headline3: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
          ),
          headline4: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
          ),
          headline5: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          headline6: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: primaryTextColor,
          ),
          subtitle2: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: bodyTextColor,
            height: 1.5,
          ),
          bodyText1: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w500,
            color: bodyTextColor,
          ),
          bodyText2: TextStyle(
            color: Colors.grey.withOpacity(0.9),
            fontWeight: FontWeight.w500,
            height: 1.5,
            fontSize: 16.0,
          ),
          button: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.w500,
            height: 1.5,
            fontSize: 12.0,
          ),
        ),
      );
}
