import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';

class QuantityUpdateWidget extends StatelessWidget {
  final Function(int)? onTap;
  final RxInt quantity;
  final double? iconSize;
  final double? buttonSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? textStyle;

  const QuantityUpdateWidget({
    super.key,
    this.onTap,
    required this.quantity,
    this.iconSize,
    this.textStyle,
    this.backgroundColor,
    this.iconColor,
    this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        IconButtonWidget.withContainer(
          icon: Icons.remove,
          height: buttonSize ?? 22.dp(),
          width: buttonSize ?? 22.dp(),
          iconSize: iconSize ?? 20.dp(),
          onTap: () {
            if (quantity.value >= 1) {
              quantity.value--;
              if (onTap != null) onTap!(quantity.value);
            }
          },
        ),
        SizedBox(width: 13.dp()),
        Obx(() => Text("${quantity.value}",
            style: textStyle ?? textTheme.bodyMedium)),
        SizedBox(width: 13.dp()),
        IconButtonWidget.withContainer(
          backgroundColor: backgroundColor ?? colorScheme.outlineVariant,
          icon: Icons.add,
          height: buttonSize ?? 22.dp(),
          width: buttonSize ?? 22.dp(),
          iconSize: iconSize ?? 20.dp(),
          iconColor: iconColor ?? colorScheme.tertiary,
          onTap: () {
            quantity.value++;
            if (onTap != null) onTap!(quantity.value);
          },
        ),
      ],
    );
  }
}
