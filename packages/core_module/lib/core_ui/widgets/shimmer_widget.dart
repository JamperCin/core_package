import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
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
    this.height,
    this.width,
  }) : length = null;

  ShimmerWidget.withList({
    super.key,
    this.length = 5,
    this.child,
  })  : height = null,
        width = null;

  @override
  Widget build(BuildContext context) {
    if (length != null) {
      child = SingleChildScrollView(
        child: Column(
          children: List<Widget>.generate(
            length!,
            (int index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 5.dp()),
              child: ListTile(
                leading: ContainerWidget.withCircular(
                  radius: 70.dp(),
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(child: DividerWidget(height: 6.dp())),
                        SizedBox(width: 10.dp()),
                        Flexible(child: DividerWidget(height: 6.dp())),
                      ],
                    ),
                    SizedBox(height: 4.dp()),
                    DividerWidget(height: 6.dp()),
                    SizedBox(height: 4.dp()),
                    DividerWidget(height: 6.dp()),
                  ],
                ),
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
