import 'package:core_module/core_module.dart';
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
    bool shouldIconPulse = true,
    Curve? forwardAnimationCurve,
    Curve? reverseAnimationCurve,
    Duration? animationDuration,
    Duration? duration,
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
      shouldIconPulse: shouldIconPulse,
      barBlur: barBlur,
      onTap: onTap,
      duration: duration,
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

  void snackBarToast({
    String message = '',
    String title = '',
    Color? bgColor,
    Color? prefixIconColor,
    Color? suffixIconColor,
    Color? textColor,
    double? prefixIconSize,
    SnackPosition? snackPosition,
    IconData prefixIcon = Icons.notifications,
    TextStyle? messageStyle,
    Color? messageColor,
    double? suffixIconSize,
    IconData? suffixIcon,
    Widget? prefixIconWidget,
    Widget? suffixIconWidget,
    bool shouldIconPulse = true,
    bool persistent = false,
    Duration? duration,
    Function()? onSuffixIconOnTap,
  }) {
    snackBar(
      title: title,
      iconColor: prefixIconColor ?? Colors.white,
      backgroundColor: bgColor ?? const Color(0xFFFF4D00),
      textColor: textColor ?? Colors.white,
      overlayBlur: 0.0,
      barBlur: 0.0,
      shouldIconPulse: shouldIconPulse,
      icon: prefixIcon,
      isDismissible: !persistent,
      duration:
          persistent ? const Duration(days: 1) : const Duration(seconds: 3),
      iconWidget: prefixIconWidget,
      iconSize: prefixIconSize ?? 20.dp(),
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      titleWidget: title.isEmpty ? const SizedBox.shrink() : null,
      messageWidget: _SnackToastWidget(
        message: message,
        style: messageStyle,
        messageColor: messageColor,
        suffixIconColor: suffixIconColor,
        suffixIconSize: suffixIconSize,
        suffixIcon: suffixIcon,
        suffixIconWidget: suffixIconWidget,
        onSuffixIconOnTap: onSuffixIconOnTap,
      ),
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
    Function()? onProgressCompletion,
    Color? actionIconColor,
    Color? closeIconColor,
    double? actionIconSize,
    IconData? actionIcon,
    Widget? messageWidget,
    Widget? actionWidget,
    bool showCloseIcon = true,
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
        showCloseIcon: showCloseIcon,
        closeIconColor: closeIconColor ?? colorScheme.surface,
        backgroundColor: snackBackgroundColor ?? colorScheme.inverseSurface,
        content: CountdownSnackBarContent(
          durationSeconds: durationSeconds,
          progressFilledColor: progressFilledColor,
          progressUnfilledFilledColor: progressUnfilledFilledColor,
          message: message,
          onProgressCompletion: onProgressCompletion,
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

class _SnackToastWidget extends StatelessWidget {
  final String? message;
  final TextStyle? style;
  final Color? messageColor;
  final Color? suffixIconColor;
  final double? suffixIconSize;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final Function()? onSuffixIconOnTap;

  const _SnackToastWidget({
    Key? key,
    this.message,
    this.style,
    this.messageColor,
    this.suffixIconColor,
    this.suffixIconSize,
    this.suffixIcon,
    this.suffixIconWidget,
    this.onSuffixIconOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            message ?? '',
            style: style ??
                textTheme.bodyMedium
                    ?.copyWith(color: messageColor ?? Colors.white),
          ),
        ),
        Gap(10.dp()),
        InkWell(
          onTap: onSuffixIconOnTap ??
              () {
                if (Get.isSnackbarOpen) {
                  Get.back();
                }
              },
          child: suffixIconWidget ??
              Icon(
                suffixIcon ?? Icons.cancel,
                color: suffixIconColor ?? Colors.white,
                size: suffixIconSize ?? 20.dp(),
              ),
        ),
      ],
    );
  }
}
