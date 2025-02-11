import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/local/bottom_bar_model.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

class BottomAppBarWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final BottomBarModel model;
  final TextStyle? style;
  final Color? inActiveColor;
  final Color? activeColor;

  const BottomAppBarWidget({
    super.key,
    this.onTap,
    required this.model,
    this.style,
    this.inActiveColor,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const double defaultSize = 20;

    return InkWell(
      splashColor: Colors.transparent, //colorScheme.secondaryFixed,
      onTap: onTap,
      child: BounceIn(
        key: model.key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            model.isBadge
                ? Badge(
                    child: model.icon == null && model.asset != null
                        ? AssetImageWidget(
                            height:
                                model.iconSize ?? appDimen.dimen(defaultSize),
                            width:
                                model.iconSize ?? appDimen.dimen(defaultSize),
                            assetColor: model.isSelected
                                ? (activeColor ?? colorScheme.primary)
                                : (inActiveColor ??
                                    model.iconColor ??
                                    colorScheme.inverseSurface),
                            asset: model.asset ?? '',
                          )
                        : Icon(
                            model.icon,
                            size: model.iconSize ?? appDimen.dimen(defaultSize),
                            color: model.isSelected
                                ? (activeColor ?? colorScheme.primary)
                                : (inActiveColor ??
                                    model.iconColor ??
                                    colorScheme.inverseSurface),
                          ),
                  )
                : model.icon == null
                    ? AssetImageWidget(
                        height: model.iconSize ?? appDimen.dimen(defaultSize),
                        width: model.iconSize ?? appDimen.dimen(defaultSize),
                        assetColor: model.isSelected
                            ? (activeColor ?? colorScheme.primary)
                            : (inActiveColor ??
                                model.iconColor ??
                                colorScheme.inverseSurface),
                        asset: model.asset ?? '',
                      )
                    : Icon(
                        model.icon,
                        size: model.iconSize ?? appDimen.dimen(defaultSize),
                        color: model.isSelected
                            ? (activeColor ?? colorScheme.primary)
                            : (inActiveColor ??
                                model.iconColor ??
                                colorScheme.inverseSurface),
                      ),
            SizedBox(height: appDimen.dimen(2)),
            model.text != null
                ? Text(
                    model.text ?? '',
                    style: style?.copyWith(
                          color: model.isSelected
                              ? (activeColor ?? colorScheme.primary)
                              : (inActiveColor ??
                                  model.iconColor ??
                                  colorScheme.inverseSurface),
                        ) ??
                        textTheme.labelMedium?.copyWith(
                          color: model.isSelected
                              ? (activeColor ?? colorScheme.primary)
                              : (inActiveColor ??
                                  model.iconColor ??
                                  colorScheme.inverseSurface),
                        ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
