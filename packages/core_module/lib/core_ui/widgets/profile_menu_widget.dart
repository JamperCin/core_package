import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';

class ProfileMenuWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String? asset;
  final IconData? icon;
  final Color? assetColor;
  final Color? iconColor;
  final Color? suffixIconColor;

  const ProfileMenuWidget({
    super.key,
    required this.onTap,
    required this.text,
    this.asset,
    this.assetColor,
    this.icon,
    this.iconColor,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    assert(!(icon != null && asset != null), "Icon and asset cannot be provided at the same time");

    return TextButtonWidget(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor ?? colorScheme.outline,
                  size: 20.dp(),
                ),
              if (asset != null)
                AssetImageWidget(
                  asset: asset!,
                  height: appDimen.dimen(24),
                  width: appDimen.dimen(24),
                  assetColor: assetColor ?? colorScheme.outline,
                ),
              if (asset != null || icon != null) SizedBox(width: appDimen.dimen(5)),
              Text(
                text,
                style: textTheme.bodyMedium,
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: suffixIconColor ?? colorScheme.outline,
            size: appDimen.dimen(20),
          )
        ],
      ),
    );
  }
}
