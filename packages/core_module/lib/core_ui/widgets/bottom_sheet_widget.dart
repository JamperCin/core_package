import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';

import '../../core/def/global_definitions.dart';

class BottomSheetWidget extends StatelessWidget {
  final BuildContext context;
  final Widget? child;
  final Widget? subChild;
  final String? title;
  final TextStyle? titleStyle;
  final double? height;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final List<Widget>? subChildList;
  final Color? color;

  BottomSheetWidget({
    super.key,
    required this.context,
    this.child,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.color,
    this.borderRadius,
    this.title,
    this.titleStyle,
    this.subChildList,
    this.subChild,
  }) {
    _showBottomSheet();
  }

  void _showBottomSheet() {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Get.bottomSheet(
      enableDrag: false,
      isDismissible: true,
      isScrollControlled: true,
      Container(
        decoration: BoxDecoration(
          color: color ?? colorScheme.tertiary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius ?? 10),
            topRight: Radius.circular(borderRadius ?? 10),
          ),
        ),
        height: height ?? appDimen.screenHeight * 0.5,
        width: width ?? appDimen.screenWidth,
        margin: margin,
        child: child ??
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: appDimen.dimen(2)),
                DividerWidget(
                  width: appDimen.dimen(70),
                  height: appDimen.dimen(1),
                ),
                SizedBox(height: appDimen.dimen(3)),
                if (title != null)
                  Text(title ?? '', style: titleStyle ?? textTheme.titleMedium),
                if (title != null) SizedBox(height: appDimen.dimen(10)),
                Expanded(
                  child: SingleChildScrollView(
                    padding: padding ??
                        EdgeInsets.symmetric(
                            horizontal: appDimen.dimen(10),
                            vertical: appDimen.dimen(16)),
                    child: subChild ??
                        Column(
                          children: subChildList ?? [],
                        ),
                  ),
                ),
                SizedBox(height: appDimen.dimen(10)),
              ],
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
