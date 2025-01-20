import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';

class CardContainerWidget extends StatelessWidget {
  final double elevation;
  final String? heading;
  final Widget? child;
  final Color? color;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const CardContainerWidget({
    super.key,
    this.elevation = 5,
    this.heading,
    this.margin,
    this.child,
    this.shape,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: color ?? colorScheme.surface,
      surfaceTintColor: color ?? colorScheme.surface,
      elevation: elevation,
      margin: margin,
      shape: shape,
      child: SingleChildScrollView(
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: appDimen.dimen(2), vertical: appDimen.dimen(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (heading != null)
              Text(
                heading ?? '',
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.inverseSurface,
                  // fontSize: appDimen.dimen(8),
                ),
              ),
            if (heading != null) SizedBox(height: appDimen.dimen(10)),
            child ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
