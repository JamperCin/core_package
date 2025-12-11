import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:core_module/src/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

import '../../core/def/global_def.dart';

class IconTextWidget extends StatelessWidget {
  final String text;
  final Widget? textWidget;
  final Widget? iconWidget;
  final Color? iconColor;
  final double? iconSize;
  final IconData? icon;
  final String? asset;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;

  const IconTextWidget({
    super.key,
    this.text = '',
    this.textWidget,
    this.iconWidget,
    this.iconColor,
    this.iconSize,
    this.textStyle,
    this.icon,
    this.asset,
    this.onTap,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ??MainAxisAlignment.center,
        children: [
          asset != null
              ? AssetImageWidget(
                  asset: asset ?? icProfile,
                  height: iconSize ?? 20.dp(),
                  width: iconSize ?? 20.dp(),
                  assetColor: iconColor ,
                )
              : iconWidget ??
                  Icon(
                    icon ?? Icons.add,
                    color: iconColor ?? colorScheme.inverseSurface,
                    size: iconSize ?? 20.dp(),
                  ),
          Gap(10.dp()),
          Expanded(
            child: textWidget ??
                Text(
                  text,
                  style: textStyle ?? textTheme.bodySmall,
                ),
          )
        ],
      ),
    );
  }
}
