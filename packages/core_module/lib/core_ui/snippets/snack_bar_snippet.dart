import 'package:core_module/src/app_module_colors.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/src/app_style.dart';

import '../widgets/Count_down_snack_bar_content.dart';

class SnackBarSnippet {
  static SnackBarSnippet? _instance;

  SnackBarSnippet._();

  factory SnackBarSnippet() {
    return _instance ??= SnackBarSnippet._();
  }

  void snackBar({
    String title = '',
    String message = '',
    IconData icon = Icons.info_outline,
    Color? backgroundColor,
    Color textColor = Colors.black,
    Color iconColor = Colors.black,
    Color? overlayColor,
    bool showProgressIndicator = false,
    SnackPosition snackPosition = SnackPosition.TOP,
    double overlayBlur = 5.0,
    double? iconSize,
    Widget? iconWidget,
    Widget? titleWidget,
    Widget? messageWidget,
    SnackStyle? snackStyle,
    double barBlur = 0.3,
    bool isDismissible = true,
    Curve? forwardAnimationCurve,
    Curve? reverseAnimationCurve,
    Duration? animationDuration,
    Function(GetSnackBar)? onTap,
  }) {
    Get.snackbar(
      title,
      message,
      icon: iconWidget ?? Icon(icon, color: iconColor, size: iconSize),
      backgroundColor: backgroundColor ?? orangePrimaryColor,
      snackPosition: snackPosition,
      showProgressIndicator: showProgressIndicator,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor ?? Colors.black.withOpacity(0.5),
      shouldIconPulse: true,
      barBlur: barBlur,
      onTap: onTap,
      isDismissible: isDismissible,
      snackStyle: snackStyle ?? SnackStyle.FLOATING,
      forwardAnimationCurve: forwardAnimationCurve ?? Curves.easeOutCirc,
      reverseAnimationCurve: reverseAnimationCurve ?? Curves.easeOutCirc,
      animationDuration: animationDuration ?? const Duration(seconds: 1),
      titleText: titleWidget ??
          Text(
            title,
            style: bodyLargeTextLightModeStyle.copyWith(color: textColor),
          ),
      messageText: messageWidget ??
          Text(
            message,
            style: labelSmallTextLightModeStyle.copyWith(
              color: textColor,
              fontWeight: FontWeight.w300,
            ),
          ),
    );
  }

  void snackBarError(String message, {String title = "Error"}) {
    snackBar(
      title: title,
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  void snackBarInfo(String message, {String title = "Info"}) {
    snackBar(
      title: title,
      message: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  void snackBarSuccess(String message, {String title = "Success"}) {
    snackBar(
      title: title,
      message: message,
      icon: Icons.done,
      backgroundColor: const Color(0xFF1C6F15),
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  void snackBarToast(
    String message, {
    String title = "",
    Color? bgColor,
    IconData icon = Icons.notifications,
  }) {
    snackBar(
      title: title,
      message: message,
      icon: icon,
      backgroundColor: const Color(0xFFFF4D00),
      textColor: Colors.white,
      iconColor: Colors.white,
      overlayBlur: 0.0,
      barBlur: 0.0,
      overlayColor: Colors.transparent,
    );
  }

  void showCountdownSnackBar(
    BuildContext context, {
    int durationSeconds = 5,
    Color? progressFilledColor,
    Color? snackBackgroundColor,
    Color? progressUnfilledFilledColor,
    String? message,
    EdgeInsets? padding,
    TextStyle? messageStyle,
    Function()? onActionOnTap,
    Color? actionIconColor,
    double? actionIconSize,
    IconData? actionIcon,
    Widget? messageWidget,
    Widget? actionWidget,
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final snackBarDuration = Duration(seconds: durationSeconds);
    final colorScheme = Theme.of(context).colorScheme;
    scaffoldMessenger.clearSnackBars(); // Clear existing

    scaffoldMessenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: snackBarDuration,
        padding: padding ?? EdgeInsets.all(5.dp()),
        showCloseIcon: true,
        backgroundColor: snackBackgroundColor ?? colorScheme.inverseSurface,
        content: CountdownSnackBarContent(
          durationSeconds: durationSeconds,
          progressFilledColor: progressFilledColor,
          progressUnfilledFilledColor: progressUnfilledFilledColor,
          message: message,
          messageStyle: messageStyle,
          onActionOnTap: onActionOnTap,
          actionIconColor: actionIconColor,
          actionIconSize: actionIconSize,
          messageWidget: messageWidget,
          actionIcon: actionIcon,
          actionWidget: actionWidget,
        ),
      ),
    );
  }
}
