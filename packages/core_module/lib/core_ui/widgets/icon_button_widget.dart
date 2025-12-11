import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/src/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';

class IconButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final double? borderWidth;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? iconColor;
  bool isContainerButton;
  final Widget? child;
  final IconData? icon;
  final double? iconSize;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? iconPadding;
  final String? asset;
  final OutlinedBorder? shape;
  final EdgeInsets? padding;

  IconButtonWidget({
    super.key,
    this.onTap,
    this.child,
    this.iconSize,
    this.borderWidth,
    this.icon,
    this.iconColor,
    this.padding,
    this.iconPadding,
    this.asset,
    this.shape,
  })  : borderColor = Colors.transparent,
        isContainerButton = false,
        height = null,
        width = null,
        borderRadius = null,
        backgroundColor = Colors.transparent;

  IconButtonWidget.withBorder({
    super.key,
    this.onTap,
    this.child,
    this.iconSize,
    this.padding,
    this.borderWidth,
    this.icon,
    this.borderColor,
    this.iconColor,
    this.iconPadding,
    this.asset,
    this.borderRadius,
    this.backgroundColor,
  })  : isContainerButton = false,
        height = null,
        shape =  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 5),
        )),
        width = null;

  IconButtonWidget.withCircularBorder({
    super.key,
    this.onTap,
    this.child,
    this.iconSize,
    this.padding,
    this.borderWidth,
    this.icon,
    this.borderColor,
    this.iconColor,
    this.iconPadding,
    this.asset,
    this.backgroundColor,
  })  : isContainerButton = false,
        shape = const CircleBorder(),
        height = null,
        borderRadius = null,
        width = null;

  IconButtonWidget.withContainer({
    super.key,
    this.onTap,
    this.child,
    this.iconSize,
    this.padding,
    this.borderWidth,
    this.icon,
    this.borderColor,
    this.iconColor,
    this.backgroundColor,
    this.height,
    this.width,
    this.asset,
    this.borderRadius,
  })  : isContainerButton = true,
        shape = null,
        iconPadding = null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isContainerButton) {
      return ContainerWidget(
        onTap: onTap,
        height: height ?? 22.dp(),
        width: width ?? 22.dp(),
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: borderRadius ?? 5,
        padding: padding,
        borderWidth: borderWidth,
        borderColor: borderColor ?? colorScheme.surfaceContainerHighest,
        child: Center(
            child: child ??
                (asset != null
                    ? _assetImage(colorScheme)
                    : Icon(
                        icon ?? Icons.arrow_back_rounded,
                        color: iconColor ?? colorScheme.inverseSurface,
                        size: iconSize ?? 16.dp(),
                      ))),
      );
    }

    return IconButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.transparent,
        side: BorderSide(
          width: borderWidth ?? 1,
          color: borderColor ?? colorScheme.inverseSurface,
        ),
        padding: padding ?? EdgeInsets.all(iconPadding ?? 3.dp()),
        shape: shape ?? const CircleBorder(),
      ),
      icon: child ??
          (asset != null
              ? _assetImage(colorScheme)
              : Icon(
                  icon ?? Icons.arrow_back_rounded,
                  color: iconColor ?? colorScheme.inverseSurface,
                  size: iconSize ?? 18.dp(),
                )),
    );
  }

  Widget _assetImage(ColorScheme colorScheme) {
    return AssetImageWidget(
      asset: asset ?? icProfile,
      height: iconSize ?? 18.dp(),
      width: iconSize ?? 18.dp(),
      assetColor: iconColor,
    );
  }
}
