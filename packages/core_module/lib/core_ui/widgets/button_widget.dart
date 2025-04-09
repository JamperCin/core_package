import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
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
  final Color? assetColor;
  Color? assetBgColor;
  final double? height;
  final double? assetSize;
  final String? asset;
  final double? borderRadius;
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
    this.borderRadius,
    this.assetColor,
    this.assetSize,
    this.asset, this.assetBgColor,
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
    this.borderRadius,
    this.assetColor,
    this.assetSize,
    this.asset, this.assetBgColor,
  }) : withOutline = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).elevatedButtonTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (withOutline) {
      backgroundColor = backgroundColor ?? colorScheme.tertiary;
      borderColor = borderColor ?? colorScheme.primary;
      assetBgColor = assetBgColor ?? colorScheme.primary;
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
          side: WidgetStateProperty.all(
            BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? backgroundColor ?? colorScheme.primary,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(borderRadius ?? 10),
                right: Radius.circular(borderRadius ?? 10),
              ),
            ),
          ),
        ),
        child: child ?? _buttonChild(context),
      ),
    );
  }

  Widget _buttonChild(BuildContext context) {
    final textTheme = Theme.of(context).elevatedButtonTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return asset != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerWidget.withCircular(
                borderColor: assetBgColor ?? colorScheme.tertiary.withOpacity(.3),
                color: assetBgColor ?? colorScheme.tertiary.withOpacity(.3),
                padding: EdgeInsets.all(3.dp()),
                child: AssetImageWidget(
                  asset: asset!,
                  height: assetSize ?? 20.dp(),
                  width: assetSize ?? 20.dp(),
                  assetColor: assetColor ?? colorScheme.tertiary,
                ),
              ),
              SizedBox(width: 20.dp()),
              Flexible(
                  child: Text(
                text,
                style: style ??
                    textTheme.style?.textStyle?.resolve(<WidgetState>{})?.copyWith(color: textColor),
              )),
              SizedBox(width: 20.dp()),
            ],
          )
        : Text(
            text,
            style: style ??
                textTheme.style?.textStyle
                    ?.resolve(<WidgetState>{})?.copyWith(color: textColor),
          );
  }
}
