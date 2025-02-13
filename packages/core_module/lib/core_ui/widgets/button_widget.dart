import 'package:flutter/material.dart';
import '../../core/def/global_def.dart';

class ButtonWidget extends StatelessWidget {
  final Widget? child;
  final String text;
  final TextStyle? style;
  final Color? backgroundColor;
  final Color? disabledColor;
  final double? height;
  final double? width;
  final bool enabled;
  final VoidCallback onTap;

  const ButtonWidget({
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
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).elevatedButtonTheme;
    final colorScheme = Theme.of(context).colorScheme;

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
                    disabledColor ?? colorScheme.primaryFixed)),
        child: child ??
            Text(
              text,
              style:
                  style ?? textTheme.style?.textStyle?.resolve(<WidgetState>{}),
            ),
      ),
    );
  }
}
