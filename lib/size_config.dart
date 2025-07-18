import 'package:flutter/material.dart';

///=> Design screen size:
final Size deviceSize = Size(393, 844);

abstract class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double _safeAreaHorizontal;
  static late double _safeBlockHorizontal;
  // static late double _safeAreaVertical;
  // static late double _safeBlockVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;

    _safeBlockHorizontal = (screenWidth - _safeAreaHorizontal);
    // _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    // _safeBlockVertical = (screenHeight - _safeAreaVertical);
  }

  static double getWidth(double width) {
    return screenWidth * (width / deviceSize.width);
  }

  static double getHeight(double height) {
    return screenWidth * (height / deviceSize.height);
  }

  static double getFontSize(double size) {
    double scale = _safeBlockHorizontal / 100;

    return (size * scale).clamp(size * 0.85, size * 1.15);
  }
}

extension ResponsiveSized on num {
  double get w => SizeConfig.getWidth(toDouble());

  double get h => SizeConfig.getHeight(toDouble());

  double get sp => SizeConfig.getFontSize(toDouble());

  SizedBox get hSpace => SizedBox(height: h);

  SizedBox get wSpace => SizedBox(width: w);
}

/// =>
/// 100.w
/// 50.h
/// 16.sp
/// hSpace و wSpace
