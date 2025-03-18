import 'package:flutter/material.dart';
import '../../core/def/global_def.dart';

class ButtonWidget extends StatelessWidget {
  final Widget? child;
  final String text;
  TextStyle? style;
  Color? backgroundColor;
  final Color? disabledColor;
  Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? borderWidth;
  final bool enabled;
  final VoidCallback onTap;
  final bool withOutline;

  ButtonWidget({
    super.key,
    this.child,
    this.text = '',
    this.style,
    required this.onTap,
    this.backgroundColor,
    this.enabled = true,
    this.disabledColor,
    this.textColor,
    this.height,
    this.width,
    this.borderColor,
    this.borderWidth,
  }) : withOutline = false;

  ButtonWidget.withOutLine({
    super.key,
    this.child,
    this.text = '',
    this.style,
    required this.onTap,
    this.backgroundColor,
    this.enabled = true,
    this.disabledColor,
    this.height,
    this.width,
    this.borderColor,
    this.textColor,
    this.borderWidth,
  }) : withOutline = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).elevatedButtonTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (withOutline) {
      backgroundColor = backgroundColor ?? colorScheme.tertiary;
      borderColor = borderColor  ?? colorScheme.primary;
      style = textTheme.style?.textStyle?.resolve(<WidgetState>{})?.copyWith(
          color: textColor ?? borderColor ?? colorScheme.primary);
    }

    return SizedBox(
      width: width ?? appDimen.screenWidth,
      height: height ?? appDimen.dimen(50),
      child: ElevatedButton(
        onPressed: enabled ? onTap : () {},
        style: textTheme.style?.copyWith(
          backgroundColor: enabled
              ? (backgroundColor != null
                  ? WidgetStateProperty.all(backgroundColor)
                  : textTheme.style?.backgroundColor)
              : WidgetStateProperty.all(
                  disabledColor ?? colorScheme.primaryFixed),
          side: WidgetStateProperty.all(BorderSide(
            width: borderWidth ?? 1,
            color: borderColor ?? backgroundColor ?? colorScheme.primary,
          )),
        ),
        child: child ??
            Text(
              text,
              style: style ??
                  textTheme.style?.textStyle
                      ?.resolve(<WidgetState>{})?.copyWith(color: textColor),
            ),
      ),
    );
  }
}
