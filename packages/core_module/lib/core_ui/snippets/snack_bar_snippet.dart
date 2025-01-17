import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/app/app_style.dart';

class SnackBarSnippet {
  static SnackBarSnippet? _instance;

  SnackBarSnippet._();

  factory SnackBarSnippet() {
    return _instance ??= SnackBarSnippet._();
  }

  void _snackBar({
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
    double barBlur = 0.3,
    Curve? forwardAnimationCurve,
    Curve? reverseAnimationCurve,
    Duration? animationDuration,
  }) {
    Get.snackbar(
      title,
      message,
      icon: Icon(icon, color: iconColor),
      backgroundColor: backgroundColor,
      snackPosition: snackPosition,
      showProgressIndicator: showProgressIndicator,
      overlayBlur: overlayBlur,
      overlayColor: overlayColor ?? Colors.black.withOpacity(0.5),
      shouldIconPulse: true,
      barBlur: barBlur,
      snackStyle: SnackStyle.FLOATING,
      forwardAnimationCurve: forwardAnimationCurve ?? Curves.easeOutCirc,
      reverseAnimationCurve: reverseAnimationCurve ?? Curves.easeOutCirc,
      animationDuration: animationDuration ?? const Duration(seconds: 1),
      titleText: Text(
        title,
        style: bodyLargeTextLightModeStyle.copyWith(color: textColor),
      ),
      messageText: Text(
        message,
        style: labelSmallTextLightModeStyle.copyWith(
          color: textColor,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  void snackBarError(String message, {String title = "Error"}) {
    _snackBar(
      title: title,
      message: message,
      icon: Icons.error,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  void snackBarInfo(String message, {String title = "Info"}) {
    _snackBar(
      title: title,
      message: message,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      iconColor: Colors.white,
    );
  }

  void snackBarSuccess(String message, {String title = "Success"}) {
    _snackBar(
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
    _snackBar(
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
}
