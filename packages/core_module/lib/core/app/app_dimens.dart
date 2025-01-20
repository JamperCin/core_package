import 'package:flutter/cupertino.dart';

class AppDimens {
  static AppDimens? _instance;
  late MediaQueryData _mediaQueryData;
  bool isTablet = false;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  static double _scaleFactor = 0.0;

  AppDimens._(BuildContext context) {
    _init(context);
  }

  factory AppDimens(BuildContext context) {
    return _instance ??= AppDimens._(context);
  }

  void _init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    isTablet = _mediaQueryData.size.shortestSide > 600;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    if (screenWidth >= 350 && screenWidth <= 500) {
      _scaleFactor = 400.0 / 100;
    } else if (screenWidth > 500 && screenWidth <= 900) {
      _scaleFactor = 500.0 / 100;
    } else if (screenWidth > 900) {
      _scaleFactor = 600.0 / 100;
    } else {
      _scaleFactor = screenWidth / 100;
    }
  }


  //y=0.1x+0.4 Linear quadratic formula : Assume
  // y=mx+c (a linear relationship).
  double _getMultiplier(double value) {
    double multiplier = (0.1 * value) + 0.4;
    return multiplier;
  }

  double _responsiveSize(double value){
    return  value * (screenWidth / 375);
  }

  double dimen(double value) {
    double multiplier = _getMultiplier(value);
    double h = _scaleFactor == 0.0 ? _responsiveSize(value) : _scaleFactor * multiplier * 1.9;
    print("Value ==> $value # Mulitplier ==> $multiplier # Results ==> $h");
    return h;
  }
}
