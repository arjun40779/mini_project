import 'package:flutter/material.dart';

import 'size_config.dart';

@immutable
class AppColors {
  static const orange = Color.fromRGBO(254, 157, 18, 1);
  static const lightGrey = Color.fromRGBO(183, 183, 183, 1);
  static const black = Color.fromRGBO(18, 18, 18, 1);
  static const darkGrey = Color.fromRGBO(65, 65, 65, 1);
  static const white = Color.fromRGBO(251, 251, 251, 1);
  static const lightBlue = Color.fromARGB(255, 123, 118, 254);
  static const ligtPurple = Color.fromARGB(255, 227, 158, 254);
}

TextStyle textStyle({
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
  Color? color,
  TextDecoration? decoration,
  double? height,
}) {
  final defaultFontSize = SizeConfig.textMultiplier * 4.3;
  const defaultFontWeight = FontWeight.w600;
  const defaultLetterSpacing = 0.0;
  const defaultFontColor = AppColors.black;
  const defaultFontHeight = 1.2;

  return TextStyle(
    fontSize: fontSize ?? defaultFontSize,
    fontWeight: fontWeight ?? defaultFontWeight,
    letterSpacing: letterSpacing ?? defaultLetterSpacing,
    color: color ?? defaultFontColor,
    height: height ?? defaultFontHeight,
  );
}
