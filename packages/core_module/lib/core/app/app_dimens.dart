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
    double addValue = 0.5;
    if(value <= 20){
      addValue = 0.5;
    }else if(value <= 30){
      addValue = 1.0;
    }else if(value <= 50){
      addValue = 1.23;
    }else if(value <= 100){
      addValue = 2.0;
    }else if(value <= 150){
      addValue = 4.0;
    }else if(value <= 450){
      addValue = 8.0;
    }else if(value <= 600){
      addValue = 15.0;
    }else{
      addValue = 20;
    }

    double multiplier = (0.1 * value) + addValue;
    return multiplier;
  }

  double _responsiveSize(double value){
    return  value * (screenWidth / 375);
  }

  double dimen(double value) {
    double multiplier = _getMultiplier(value);
    double h = _scaleFactor == 0.0 ? _responsiveSize(value) : (_scaleFactor * multiplier * 1.9);
   // debugPrint("Value ==> $value # Mulitplier ==> $multiplier # Results ==> $h");
    return h;
  }

  ///Aspect Ratio and ChildAspectRatio
   double getAspectRatio({double v = 2.0}) {
    double defaultRatio = v;

    if (screenWidth <= 374) {
      defaultRatio = v * 1.1;
    } else if (screenWidth >= 375 && screenWidth <= 380) {
      defaultRatio = v;
    } else if (screenWidth > 380 && screenWidth < 450) {
      defaultRatio = v * 1.13;
    } else if (screenWidth > 450 && screenWidth < 550) {
      defaultRatio = v * 1.2;
    } else if (screenWidth > 550 && screenWidth < 650) {
      defaultRatio = v * 1.32;
    } else if (screenWidth >= 650 && screenWidth <= 900) {
      defaultRatio = v * 1.4;
    } else if (screenWidth > 900) {
      defaultRatio = v * 1.5;
    }

    return defaultRatio;
  }

   double getGridAspectRatio({double v = 1.2}) {
    double defaultRatio = v;

    if (screenWidth <= 374) {
      defaultRatio = v * 1.01;
    } else if (screenWidth >= 375 && screenWidth <= 380) {
      defaultRatio = v;
    } else if (screenWidth > 380 && screenWidth < 430) {
      defaultRatio = v * 1.02;
    } else if (screenWidth > 430 && screenWidth < 650) {
      defaultRatio = v * 1.15;
    } else if (screenWidth >= 650 && screenWidth <= 900) {
      defaultRatio = v * 1.25;
    } else if (screenWidth > 900) {
      defaultRatio = v * 1.35;
    }

    return defaultRatio;
  }
}
