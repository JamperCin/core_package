import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';

class ProfileMenuWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String asset;
  final Color? assetColor;

  const ProfileMenuWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.asset,
    this.assetColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return TextButtonWidget(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (asset.isNotEmpty)
                AssetImageWidget(
                  asset: asset,
                  height: appDimen.dimen(15),
                  width: appDimen.dimen(15),
                  assetColor: assetColor?? colorScheme.onSecondary,
                ),
              if (asset.isNotEmpty) SizedBox(width: appDimen.dimen(1)),
              Text(
                text,
                style: textTheme.bodyMedium
                    ?.copyWith(color: colorScheme.inverseSurface),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: colorScheme.onSecondary,
            size: appDimen.dimen(10),
          )
        ],
      ),
    );
  }
}
