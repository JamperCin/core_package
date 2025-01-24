import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';

class QuantityUpdateWidget extends StatelessWidget {
  final Function(int)? onTap;
  final RxInt quantity;

  const QuantityUpdateWidget({super.key, this.onTap, required this.quantity});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        IconButtonWidget.withContainer(
          icon: Icons.remove,
          onTap: () {
            if (quantity.value >= 1) {
              quantity.value--;
              if (onTap != null) onTap!(quantity.value);
            }
          },
        ),
        SizedBox(width: appDimen.dimen(2)),
        Obx(() => Text("${quantity.value}", style: textTheme.bodyMedium)),
        SizedBox(width: appDimen.dimen(2)),
        IconButtonWidget.withContainer(
          backgroundColor: colorScheme.outlineVariant,
          icon: Icons.add,
          iconColor: colorScheme.tertiary,
          onTap: () {
            quantity.value++;
            if (onTap != null) onTap!(quantity.value);
          },
        ),
      ],
    );
  }
}
