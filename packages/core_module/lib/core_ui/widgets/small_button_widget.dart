import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SmallButtonWidget extends StatelessWidget {
  final GlobalKey<AnimatorWidgetState>? keyIcon;
  final GlobalKey<AnimatorWidgetState>? keyText;
  final GestureTapCallback? onTap;
  final IconData? iconData;
  final String? text;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final double? iconSize;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final Widget? iconWidget;
  final Widget? textWidget;

  const SmallButtonWidget({
    super.key,
    this.keyIcon,
    this.keyText,
    this.onTap,
    this.iconData,
    this.text,
    this.color,
    this.textStyle,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.margin,
    this.borderColor,
    this.iconWidget,
    this.textWidget,
    this.iconColor,
    this.iconSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ContainerWidget(
      onTap: onTap,
      borderRadius: borderRadius ?? 30,
      width: width ?? appDimen.screenWidth * 0.4,
      height: height,
      borderColor: borderColor ?? colorScheme.primaryFixedDim,
      color: color ?? colorScheme.primaryFixedDim,
      margin: margin,
      padding:
          padding ?? EdgeInsets.symmetric(horizontal: 8.dp(), vertical: 8.dp()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          keyIcon != null
              ? FadeInUp(
                key: keyIcon,
                child:
                    iconWidget ??
                    Icon(
                      iconData ?? Icons.arrow_upward_outlined,
                      color: iconColor ?? colorScheme.surface,
                      size: iconSize ?? 20.dp(),
                    ),
              )
              : iconWidget ??
                  Icon(
                    iconData ?? Icons.arrow_upward_outlined,
                    color: iconColor ?? colorScheme.surface,
                    size: iconSize ?? 20.dp(),
                  ),
          Gap(10.dp()),
          keyText != null
              ? FadeInUp(
                key: keyText,
                child:
                    textWidget ??
                    Text(
                      text ?? "Send Money",
                      style:
                          textStyle ??
                          textTheme.bodyMedium?.copyWith(
                            color: textColor ?? colorScheme.surface,
                          ),
                    ),
              )
              : textWidget ??
                  Text(
                    text ?? "Send Money",
                    style:
                        textStyle ??
                        textTheme.bodyMedium?.copyWith(
                          color: textColor ?? colorScheme.surface,
                        ),
                  ),
        ],
      ),
    );
  }
}
