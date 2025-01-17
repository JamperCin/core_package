import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/snippets/ui_snippet.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';

class DividerWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final Widget? child;
  final String? text;

  const DividerWidget({
    super.key,
    this.height,
    this.width,
    this.color,
  })  : child = null,
        text = null;

  const DividerWidget.withChild({
    super.key,
    this.height,
    this.width,
    this.color,
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (child != null || text != null) {
      return Row(
        children: [
          Flexible(child: _divider(colorScheme)),
          SizedBox(width: appDimen.dimen(20)),
          child ??
              Text(
                text ?? '',
                style: textTheme.labelMedium,
              ),
          SizedBox(width: appDimen.dimen(20)),
          Flexible(child: _divider(colorScheme)),
        ],
      );
    }

    return _divider(colorScheme);
  }

  Widget _divider(ColorScheme colorScheme) {
    return ContainerWidget(
      color: color ?? colorScheme.surfaceDim,
      height: height ?? 1,
      width: width ?? appDimen.screenWidth,
    );
  }
}
