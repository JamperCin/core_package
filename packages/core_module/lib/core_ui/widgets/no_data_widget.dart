import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/src/assets_path.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String? asset;
  final Widget? assetWidget;
  final Color? assetColor;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final String title;
  final String description;

  const NoDataWidget({
    super.key,
    this.asset,
    this.title = "Empty List",
    this.description = "You have no data to show",
    this.assetWidget,
    this.assetColor,
    this.titleStyle,
    this.subTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.dp(), vertical: 20.dp()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(40.dp()),
            assetWidget ??
                AssetImageWidget(
                  asset: asset ?? icMenuFilter,
                  height: 100.dp(),
                  width: 80.dp(),
                  assetColor: assetColor,
                ),
            Gap(40.dp()),
            Text(
              title,
              style: titleStyle ?? textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Gap(10.dp()),
            Text(
              description,
              style: subTitleStyle ?? textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            Gap(20.dp()),
          ],
        ),
      ),
    );
  }
}
