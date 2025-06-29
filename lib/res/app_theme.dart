import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_style.dart';

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
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      maximumSize: Size(appDimen.screenWidth, 55.dp()),
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
    surface: whiteColor,
    inverseSurface: darkSurfaceColor,
    surfaceDim: darkColor,
    surfaceBright: greyTertiaryColor,

    ///Tertiary colors
    tertiary: whiteColor,
    //-----TODO : ----------------     Colors to consider

    inversePrimary: greenFaded,

    onPrimary: secondaryGreenColor,
    primaryContainer: orangeQuadColor,
    primaryFixedDim: greenTertiaryColor,
    primaryFixed: orangeFadeColor,

    ///Secondary colors

    onSecondary: greySecondaryColor,
    secondaryContainer: greyTertiaryColor,

    ///Error
    onError: redColor,

    ///Surface

    onSurface: darkColor,
    surfaceContainerLowest: darkSurfaceColor,
    surfaceContainerLow: darkSurfaceVariant,
    surfaceContainerHigh: greyPodActiveColor,
    surfaceContainerHighest: greyTertiaryColor,
    onInverseSurface: darkSurfaceVariant,

    ///Inverse surface

    ///Green color
    outline: dividerColor,
    shadow: greyTertiaryLightColor,
    outlineVariant: darkBrownColor,
  ),
);

ThemeData darkMode = lightMode.copyWith(
  brightness: Brightness.dark,
  dialogBackgroundColor: darkColor,
  textTheme: TextTheme(
    labelSmall: labelSmallTextLightModeStyle.copyWith(color: whiteColor),
    labelMedium: labelMediumTextLightModeStyle.copyWith(color: whiteColor),
    labelLarge: labelLargeTextLightModeStyle.copyWith(color: whiteColor),
    //
    bodySmall: bodySmallTextLightModeStyle.copyWith(color: whiteColor),
    bodyLarge: bodyLargeTextLightModeStyle.copyWith(color: whiteColor),
    bodyMedium: bodyMediumTextLightModeStyle.copyWith(color: whiteColor),

    displayLarge: displayLargeTextLightModeStyle.copyWith(color: whiteColor),
    displayMedium: displayMediumTextLightModeStyle.copyWith(color: whiteColor),
    displaySmall: displaySmallTextLightModeStyle.copyWith(color: whiteColor),
    //
    headlineLarge: headingLargeTextLightModeStyle.copyWith(color: whiteColor),
    headlineMedium: headingMediumTextLightModeStyle.copyWith(color: whiteColor),
    headlineSmall: headingSmallTextLightModeStyle.copyWith(color: whiteColor),
    //
    titleLarge: titleLargeTextLightModeStyle.copyWith(color: whiteColor),
    titleMedium: titleMediumTextLightModeStyle.copyWith(color: whiteColor),
    titleSmall: titleSmallTextLightModeStyle.copyWith(color: whiteColor),
  ),
  /*elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5.0,
      backgroundColor: whiteColor,
      textStyle: normalButtonLightModeStyle,
      disabledForegroundColor: disabledGreenColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10),
          right: Radius.circular(10),
        ),
      ),
    ),
  ),*/
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
    surface: darkColor,
    inverseSurface: whiteColor,
    surfaceDim: greyPodActiveColor,
    surfaceBright: greyPodInactiveColor,

    surfaceContainerLowest: greyPrimaryColor,
    surfaceContainerLow: darkBrownColor,
    surfaceContainerHigh: greyPodActiveColor,
    surfaceContainerHighest: greyPrimaryColor,
    ///Tertiary colors
    tertiary: whiteColor,
    //-----TODO : ----------------     Colors to consider

    inversePrimary: greenFaded,

    onPrimary: secondaryGreenColor,
    primaryContainer: orangeQuadColor,
    primaryFixedDim: tertiaryGreenColor,
    primaryFixed: orangeFadeColor,

    ///Secondary colors

    onSecondary: greySecondaryColor,
    secondaryContainer: greyTertiaryColor,

    ///Error
    onError: redColor,

    ///Surface

    onSurface: darkColor,
    onInverseSurface: darkSurfaceVariant,

    ///Inverse surface

    ///Green color
    outline: dividerColor,
    shadow: darkBrownColor,
    outlineVariant: darkBrownColor,
  ),
);
