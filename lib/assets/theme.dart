import 'package:flutter/material.dart';
import 'package:khalifa/assets/colors.dart';
import 'package:khalifa/assets/fonts.dart';

class AppTheme {
  ThemeData darkTheme() => ThemeData();
  ThemeData lightTheme() {
    final colors = AppColors();
    return ThemeData(
        scaffoldBackgroundColor: colors.lightThemeBgColor,
        appBarTheme: AppBarTheme(
          backgroundColor: colors.lightThemeBgColor,
        ),
        bottomAppBarTheme: BottomAppBarTheme(color: colors.lightThemeBgColor),
        fontFamily: "Barlow",
        extensions: [
          AppFonts(
            fontSize60Weight600: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w600,
              color: colors.white,
            ),
            fontSize16Weight500: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colors.white,
            ),
            fontSize12Weight600ColorBlushLetterSpacing08: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colors.blush,
              letterSpacing: 0.8,
            ),
            fontSize16Weight500ColorDarkOpacity05: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colors.dark1.withOpacity(0.5),
            ),
            fontSize16Weight400ColorGreenish: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.greyish1,
            ),
            fontSize16Weight600UnderLineBlush: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: colors.blush,
              color: colors.blush,
            ),
            fontSize24Weight600Dark: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: colors.dark1.withOpacity(0.8),
            ),
            fontSize13Weight500Dark: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: colors.dark1,
            ),
            fontSize13Weight500White: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: colors.white,
            ),
            fontSize14Weight400Dark: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: colors.dark1,
            ),
            fontSize16Weight500Dark: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colors.dark1,
            ),
            fontSize24Weight500Dark: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: colors.dark1,
            ),
            fontSize22Weight500Red: TextStyle(
              fontSize: 22,
              color: colors.redish1,
              fontWeight: FontWeight.w600,
            ),
            fontSize16Weight500White: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colors.white,
            ),
            fontSize16Weight500Blush: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: colors.blush,
            ),
            fontSize26Weight500WhitishDark: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: colors.whitishDark,
            ),
            fontSize35Weight600Spacing08: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: colors.dark1,
              letterSpacing: 0.8,
            ),
            fontSize20Weight400Dark: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: colors.dark1,
            ),
            fontSize17Weight400Dark: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: colors.dark1.withOpacity(0.6),
            ),
            fontSize17Weight400White: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: colors.white,
            ),
            fontSize16Weight400WhitishDark: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: colors.whitishDark,
            ),
            fontSize24Weight500DarkSpacing1: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              fontSize: 24,
            ),
            fontSize25Weight500Dark: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: colors.dark1,
            ),
            fontSize20Weight500Blush: TextStyle(
              fontSize: 20,
              color: colors.blush,
              fontWeight: FontWeight.w500,
            ),
            fontSize22Weight500Greenish: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: colors.greenish1,
            ),
            fontSize22Weight500Greeyish: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: colors.greyish1,
            ),
          ),
        ]);
  }
}
