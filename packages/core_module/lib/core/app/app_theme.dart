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

    //-----TODO : ----------------     Colors to consider

    ///primary colors and inverted color
    primary: primaryGreenColor,
    ///Secondary colors
    secondary: greyPrimaryColor,
    ///Error
    error: redColor,

    ///Surface --> [surface] and [inverseSurface] should be two contrasting colors
    surface: darkSurfaceColor,
    inverseSurface: whiteColor,
    surfaceDim: darkColor,
    surfaceBright: dividerColor,

    ///Tertiary colors
    tertiary: whiteColor,
    //-----TODO : ----------------     Colors to consider


    inversePrimary: greenFaded,

    onPrimary: secondaryGreenColor,
    primaryContainer: orangeQuadColor,
    primaryFixedDim: orangeXColor,
    primaryFixed: orangeFadeColor,

    ///Secondary colors

    onSecondary: greySecondaryColor,
    secondaryContainer: greyTertiaryColor,



    ///Error
    onError: redColor,

    ///Surface

    onSurface: whiteColor,
    onInverseSurface: darkSurfaceVariant,

    ///Inverse surface


    ///Green color
    outline: greenPrimaryColor,
    shadow: greyTertiaryLightColor,
    outlineVariant: darkBrownColor,

  ),
);

ThemeData darkMode = lightMode.copyWith(
  brightness: Brightness.dark,
  dialogBackgroundColor: darkColor,
);
