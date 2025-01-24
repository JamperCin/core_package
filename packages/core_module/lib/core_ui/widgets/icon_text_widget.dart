import 'package:flutter/material.dart';
import 'package:core_module/core/res/assets_path.dart';
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
                  height: iconSize ?? appDimen.dimen(10),
                  width: iconSize ?? appDimen.dimen(10),
                  assetColor: iconColor,
                )
              : iconWidget ??
                  Icon(
                    icon ?? Icons.add,
                    color: iconColor,
                    size: iconSize ?? appDimen.dimen(10),
                  ),
          SizedBox(width: appDimen.dimen(10)),
          textWidget ??
              Text(
                text,
                style: textStyle ?? textTheme.bodySmall,
              )
        ],
      ),
    );
  }
}
