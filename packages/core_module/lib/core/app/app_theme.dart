import 'package:core_module/core/app/app_module_colors.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/app/app_style.dart';


ThemeData lightMode = ThemeData(
  dialogBackgroundColor: whiteColor,
  brightness: Brightness.light,
  textTheme: TextTheme(
    labelSmall: labelSmallTextLightModeStyle,
    labelMedium: labelMediumTextLightModeStyle,
    labelLarge: labelLargeTextLightModeStyle,
    //
    bodySmall: bodySmallTextLightModeStyle,
    bodyLarge: bodyLargeTextLightModeStyle,
    bodyMedium: bodyMediumTextLightModeStyle,

    displayLarge: displayLargeTextLightModeStyle,
    displayMedium: displayMediumTextLightModeStyle,
    displaySmall: displaySmallTextLightModeStyle,
    //
    headlineLarge: headingLargeTextLightModeStyle,
    headlineMedium: headingMediumTextLightModeStyle,
    headlineSmall: headingSmallTextLightModeStyle,
    //
    titleLarge: titleLargeTextLightModeStyle,
    titleMedium: titleMediumTextLightModeStyle,
    titleSmall: titleSmallTextLightModeStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: primaryGreenColor,
      textStyle: normalButtonLightModeStyle,
      disabledForegroundColor: disabledGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: primaryGreenColor,
      textStyle: normalButtonLightModeStyle,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(18),
          right: Radius.circular(18),
        ),
      ),
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.light,

    ///primary colors and inverted color
    primary: primaryGreenColor,
    inversePrimary: greenFaded,
    //
    onPrimary: secondaryGreenColor,
    primaryContainer: orangeQuadColor,
    primaryFixedDim: orangeXColor,
    primaryFixed: orangeFadeColor,

    ///Secondary colors
    secondary: greyPrimaryColor,
    onSecondary: greySecondaryColor,
    secondaryContainer: greyTertiaryColor,

    ///Tertiary colors
    tertiary: whiteColor,

    ///Error
    error: redColor,
    onError: redColor,

    ///Surface
    surface: greySecondaryColor,
    onSurface: whiteColor,

    ///Inverse surface
    inverseSurface: darkColor,

    ///Green color
    outline: greenPrimaryColor,
    shadow: greyTertiaryLightColor,
    outlineVariant: darkBrownColor,
    surfaceDim: dividerColor,
  ),
);

ThemeData darkMode = lightMode.copyWith(
  brightness: Brightness.dark,
  dialogBackgroundColor: darkColor,
);
