import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double textMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockVertical;
  static late double safeBlockHorizontal;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    widthMultiplier = screenWidth / 100;
    heightMultiplier = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.bottom + _mediaQueryData.padding.top;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    textMultiplier = safeBlockHorizontal;
  }
}
