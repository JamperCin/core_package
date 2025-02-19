import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? splashColor;
  final Widget? child;
  final bool textOnly;
  final EdgeInsetsGeometry? padding;
  final VoidCallback onTap;

  const TextButtonWidget({
    super.key,
    this.textColor,
    this.style,
    this.text = '',
    this.child,
    this.padding,
    this.backgroundColor,
    required this.onTap,
  })  : splashColor = null,
        textOnly = false;

  const TextButtonWidget.withTextOnly({
    super.key,
    this.textColor,
    this.splashColor,
    this.style,
    this.text = '',
    required this.onTap,
  })  : textOnly = true,
        backgroundColor = null,
        child = null,
        padding = null;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (textOnly) {
      return InkWell(
        onTap: onTap,
        splashColor: splashColor,
        child: Text(
          text,
          style: style ?? textTheme.bodyMedium?.copyWith(color: textColor),
        ),
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.transparent, // Set text color
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: appDimen.dimen(2),
                vertical: appDimen.dimen(2)), // Padding
      ),
      onPressed: onTap,
      child: child ??
          Text(text,
              style: style ?? textTheme.bodyMedium?.copyWith(color: textColor)),
    );
  }
}
