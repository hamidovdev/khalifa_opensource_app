import 'package:flutter/material.dart';

class AppFonts extends ThemeExtension<AppFonts> {
  final TextStyle fontSize60Weight600;
  final TextStyle fontSize16Weight500;
  final TextStyle fontSize12Weight600ColorBlushLetterSpacing08;
  final TextStyle fontSize16Weight500ColorDarkOpacity05;
  final TextStyle fontSize16Weight400ColorGreenish;
  final TextStyle fontSize16Weight600UnderLineBlush;
  final TextStyle fontSize24Weight600Dark;
  final TextStyle fontSize24Weight500Dark;
  final TextStyle fontSize22Weight500Red;
  final TextStyle fontSize16Weight500White;
  final TextStyle fontSize16Weight500Blush;
  final TextStyle fontSize26Weight500WhitishDark;
  final TextStyle fontSize16Weight500Dark;
  final TextStyle fontSize14Weight400Dark;
  final TextStyle fontSize13Weight500Dark;
  final TextStyle fontSize13Weight500White;
  final TextStyle fontSize35Weight600Spacing08;
  final TextStyle fontSize20Weight400Dark;
  final TextStyle fontSize17Weight400Dark;
  final TextStyle fontSize17Weight400White;
  final TextStyle fontSize16Weight400WhitishDark;
  final TextStyle fontSize24Weight500DarkSpacing1;
  final TextStyle fontSize25Weight500Dark;
  final TextStyle fontSize20Weight500Blush;
  final TextStyle fontSize22Weight500Greenish;
  final TextStyle fontSize22Weight500Greeyish;

  AppFonts({
    required this.fontSize60Weight600,
    required this.fontSize16Weight500,
    required this.fontSize12Weight600ColorBlushLetterSpacing08,
    required this.fontSize16Weight500ColorDarkOpacity05,
    required this.fontSize16Weight400ColorGreenish,
    required this.fontSize16Weight600UnderLineBlush,
    required this.fontSize24Weight600Dark,
    required this.fontSize24Weight500Dark,
    required this.fontSize22Weight500Red,
    required this.fontSize16Weight500White,
    required this.fontSize26Weight500WhitishDark,
    required this.fontSize16Weight500Blush,
    required this.fontSize16Weight500Dark,
    required this.fontSize14Weight400Dark,
    required this.fontSize13Weight500Dark,
    required this.fontSize13Weight500White,
    required this.fontSize35Weight600Spacing08,
    required this.fontSize20Weight400Dark,
    required this.fontSize17Weight400Dark,
    required this.fontSize17Weight400White,
    required this.fontSize16Weight400WhitishDark,
    required this.fontSize24Weight500DarkSpacing1,
    required this.fontSize25Weight500Dark,
    required this.fontSize20Weight500Blush,
    required this.fontSize22Weight500Greenish,
    required this.fontSize22Weight500Greeyish,
  });

  @override
  ThemeExtension<AppFonts> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppFonts> lerp(ThemeExtension<AppFonts>? other, double t) {
    if (other is! AppFonts) {
      return this;
    }

    return AppFonts(
      fontSize60Weight600: fontSize60Weight600,
      fontSize16Weight500: fontSize16Weight500,
      fontSize12Weight600ColorBlushLetterSpacing08:
          fontSize12Weight600ColorBlushLetterSpacing08,
      fontSize16Weight500ColorDarkOpacity05:
          fontSize16Weight500ColorDarkOpacity05,
      fontSize16Weight400ColorGreenish: fontSize16Weight400ColorGreenish,
      fontSize16Weight600UnderLineBlush: fontSize16Weight600UnderLineBlush,
      fontSize24Weight600Dark: fontSize24Weight600Dark,
      fontSize24Weight500Dark: fontSize24Weight500Dark,
      fontSize22Weight500Red: fontSize22Weight500Red,
      fontSize16Weight500White: fontSize16Weight500White,
      fontSize26Weight500WhitishDark: fontSize26Weight500WhitishDark,
      fontSize16Weight500Blush: fontSize16Weight500Blush,
      fontSize16Weight500Dark: fontSize16Weight500Dark,
      fontSize14Weight400Dark: fontSize14Weight400Dark,
      fontSize13Weight500Dark: fontSize13Weight500Dark,
      fontSize13Weight500White: fontSize13Weight500White,
      fontSize35Weight600Spacing08: fontSize35Weight600Spacing08,
      fontSize20Weight400Dark: fontSize20Weight400Dark,
      fontSize17Weight400Dark: fontSize17Weight400Dark,
      fontSize17Weight400White: fontSize17Weight400White,
      fontSize16Weight400WhitishDark: fontSize16Weight400WhitishDark,
      fontSize24Weight500DarkSpacing1: fontSize24Weight500DarkSpacing1,
      fontSize25Weight500Dark: fontSize25Weight500Dark,
      fontSize20Weight500Blush: fontSize20Weight500Blush,
      fontSize22Weight500Greenish: fontSize22Weight500Greenish,
      fontSize22Weight500Greeyish: fontSize22Weight500Greeyish,
    );
  }
}
