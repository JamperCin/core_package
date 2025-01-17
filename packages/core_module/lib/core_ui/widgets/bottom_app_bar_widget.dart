import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/model/local/bottom_bar_model.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

class BottomAppBarWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final BottomBarModel model;

  const BottomAppBarWidget({
    super.key,
    this.onTap,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const double defaultSize = 5;

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
                                ? colorScheme.primary
                                : (model.iconColor ?? colorScheme.onSecondary),
                            asset: model.asset ?? '',
                          )
                        : Icon(
                            model.icon,
                            size: model.iconSize ?? appDimen.dimen(defaultSize),
                            color: model.isSelected
                                ? colorScheme.primary
                                : (model.iconColor ?? colorScheme.onSecondary),
                          ),
                  )
                : model.icon == null
                    ? AssetImageWidget(
                        height: model.iconSize ?? appDimen.dimen(defaultSize),
                        width: model.iconSize ?? appDimen.dimen(defaultSize),
                        assetColor: model.isSelected
                            ? colorScheme.primary
                            : (model.iconColor ?? colorScheme.inverseSurface),
                        asset: model.asset ?? '',
                      )
                    : Icon(
                        model.icon,
                        size: model.iconSize ?? appDimen.dimen(defaultSize),
                        color: model.iconColor,
                      ),
            SizedBox(height: appDimen.dimen(-5)),
            model.text != null
                ? Text(
                    model.text ?? '',
                    style: textTheme.labelMedium?.copyWith(
                        color: model.isSelected
                            ? colorScheme.primary
                            : (model.iconColor ?? colorScheme.inverseSurface),
                        fontSize: appDimen.dimen(0.4)),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
