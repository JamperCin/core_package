import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final int? length;
  Widget? child;
  double? height;
  double? width;

  ShimmerWidget({
    super.key,
    this.child,
    this.height,this.width,
  }) : length = null;

  ShimmerWidget.withList({
    super.key,
    this.length = 5,
    this.child,
  }) : height = null, width = null;

  @override
  Widget build(BuildContext context) {
    if (length != null) {
      child = SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(
            length!,
            (int index) => ListTile(
              leading: AssetImageWidget(
                asset: icProfile,
                height: appDimen.dimen(120),
                width: appDimen.dimen(110),
              ),
              title: DividerWidget(height: appDimen.dimen(10)),
              subtitle: Column(
                children: [
                  DividerWidget(height: appDimen.dimen(2)),
                  SizedBox(height: appDimen.dimen(1)),
                  DividerWidget(height: appDimen.dimen(2)),
                  SizedBox(height: appDimen.dimen(5)),
                  DividerWidget(height: appDimen.dimen(3)),
                ],
              ),
            ),
          ),
        ),
      );
      return _shimmer(context);
    }

    return _shimmer(context);
  }

  Widget _shimmer(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: colorScheme.tertiary,
      child: child ??
          Container(
            color: colorScheme.tertiary,
            height: height ?? appDimen.dimen(150),
            width: width ?? appDimen.screenWidth * 0.8,
          ),
    );
  }
}
