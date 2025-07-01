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
  final double? assetPadding;
  final double? assetSize;
  final String? asset;
  double? borderRadius;
  final double? width;
  final double? borderWidth;
  final bool enabled;
  final VoidCallback onTap;
  final bool withOutline;
  final bool? isLoading;
  final Widget? loaderWidget;
  final Color? loaderColor;

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
    this.asset,
    this.isLoading,
    this.loaderWidget,
    this.assetBgColor,
    this.assetPadding,
    this.loaderColor,
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
    this.loaderWidget,
    this.borderColor,
    this.textColor,
    this.borderWidth,
    this.borderRadius,
    this.assetColor,
    this.assetSize,
    this.asset,
    this.assetBgColor,
    this.assetPadding,
    this.isLoading,
    this.loaderColor,
  }) : withOutline = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).elevatedButtonTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final WidgetStateProperty<OutlinedBorder?>? shapeDefined;
    if (borderRadius != null) {
      shapeDefined = WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      );
    } else {
      shapeDefined = textTheme.style?.shape ??
          WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 10),
              ),
            ),
          );
    }

    if (withOutline) {
      backgroundColor = backgroundColor ?? colorScheme.tertiary;
      borderColor = borderColor ?? colorScheme.primary;
      assetBgColor = assetBgColor ?? colorScheme.primary;
      style = textTheme.style?.textStyle?.resolve(<WidgetState>{})?.copyWith(
          color: textColor ?? borderColor ?? colorScheme.primary);
    }

    final OutlinedBorder? shape = textTheme.style?.shape?.resolve({});
    // If it's a RoundedRectangleBorder, extract the BorderRadius
    BorderRadius? radius;
    if (shape is RoundedRectangleBorder) {
      radius = shape.borderRadius as BorderRadius?;
    }
    if (radius != null) {
      borderRadius = borderRadius ?? radius.topRight.x;
    }

    return SizedBox(
      width: width ?? appDimen.screenWidth,
      height: height ??
          textTheme.style?.maximumSize?.resolve(<WidgetState>{})?.height ??
          55.dp(),
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
              color: borderColor ??
                  (enabled
                      ? (backgroundColor ?? colorScheme.primary)
                      : disabledColor ?? colorScheme.primaryFixed),
            ),
          ),
          shape: shapeDefined,
        ),
        child: child ?? _buttonChild(context),
      ),
    );
  }

  Widget _buttonChild(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return asset != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerWidget.withCircular(
                borderColor:
                    assetBgColor ?? colorScheme.tertiary.withOpacity(.3),
                color: assetBgColor ?? colorScheme.tertiary.withOpacity(.3),
                padding: EdgeInsets.all(assetPadding ?? 5.dp()),
                child: AssetImageWidget(
                  asset: asset!,
                  height: assetSize ?? 20.dp(),
                  width: assetSize ?? 20.dp(),
                  assetColor: assetColor ?? colorScheme.tertiary,
                ),
              ),
              // SizedBox(width: 20.dp()),
              Flexible(child: _buttonText(context)),
              SizedBox(width: 20.dp()),
            ],
          )
        : _buttonText(context);
  }

  Widget _buttonText(BuildContext context) {
    final textTheme = Theme.of(context).elevatedButtonTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (isLoading != null && isLoading!) {
      return loaderWidget ??
          SizedBox(
            height: 30.dp(),
            width: 30.dp(),
            child: CircularProgressIndicator(
              color: colorScheme.tertiary,
              strokeCap: StrokeCap.round,
            ),
          );
    }

    return RichText(
      maxLines: 1,
      text: TextSpan(
        text: text,
        style: style ??
            textTheme.style?.textStyle?.resolve(<WidgetState>{})?.copyWith(
                color: textColor ?? colorScheme.tertiary),
      ),
    );
  }
}
