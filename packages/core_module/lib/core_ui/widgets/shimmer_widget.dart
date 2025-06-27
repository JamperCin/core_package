import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final int? length;
  Widget? child;
  double? height;
  double? width;
  int? grid;

  ShimmerWidget({
    super.key,
    this.child,
    this.height,
    this.width,
  })  : length = null,
        grid = null;

  ShimmerWidget.withList({
    super.key,
    this.length = 5,
    this.child,
  })  : height = null,
        width = null,
        grid = null;

  ShimmerWidget.withGrid({
    super.key,
    this.length = 7,
    this.child,
    this.grid = 2,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (grid != null && length != null) {
      height = height ?? appDimen.dimen(150);
      width = width ?? appDimen.dimen(80);

      child = ContainerWidget(
        width: width,
        height: height,
      );

      return SizedBox(
        height: appDimen.screenHeight,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: grid!,
          children: List.generate(
              length!,
              (index) => Padding(
                    padding: EdgeInsets.all(5.dp()),
                    child: _shimmer(context),
                  )),
        ),
      );
    }

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
                  color: colorScheme.surfaceContainerHigh,
                ),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                            child: DividerWidget(
                          height: 6.dp(),
                          color: colorScheme.surfaceContainerHigh,
                        )),
                        SizedBox(width: 10.dp()),
                        Flexible(
                            child: DividerWidget(
                          height: 6.dp(),
                          color: colorScheme.surfaceContainerHigh,
                        )),
                      ],
                    ),
                    SizedBox(height: 4.dp()),
                    DividerWidget(
                      height: 6.dp(),
                      color: colorScheme.surfaceContainerHigh,
                    ),
                    SizedBox(height: 4.dp()),
                    DividerWidget(
                      height: 6.dp(),
                      color: colorScheme.surfaceContainerHigh,
                    ),
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

  Widget _shimmer(BuildContext context, {ShimmerDirection? direction}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: Colors.transparent,
      highlightColor: colorScheme.tertiary,
      direction: direction ?? ShimmerDirection.ltr,
      child: child ??
          Container(
            color: colorScheme.inverseSurface,
            height: height ?? appDimen.dimen(150),
            width: width ?? appDimen.screenWidth * 0.8,
          ),
    );
  }
}
