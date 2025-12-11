import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';

class QuantityUpdateWidget extends StatefulWidget {
  final Function(int)? onTap;
  final int initialQuantity;
  final double? iconSize;
  final double? buttonSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final TextStyle? textStyle;

  const QuantityUpdateWidget({
    super.key,
    this.onTap,
    this.initialQuantity = 1,
    this.iconSize,
    this.textStyle,
    this.backgroundColor,
    this.iconColor,
    this.buttonSize,
  });

  @override
  State<QuantityUpdateWidget> createState() => _QuantityUpdateWidgetState();
}

class _QuantityUpdateWidgetState extends State<QuantityUpdateWidget> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity < 0 ? 0 : widget.initialQuantity;
  }

  void _updateQuantity(int delta) {
    setState(() {
      quantity = (quantity + delta).clamp(0, 999999); // Prevent negative quantity
    });
    widget.onTap?.call(quantity);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        IconButtonWidget.withContainer(
          icon: Icons.remove,
          height: widget.buttonSize ?? 22.dp(),
          width: widget.buttonSize ?? 22.dp(),
          iconSize: widget.iconSize ?? 20.dp(),
          onTap: () => _updateQuantity(-1),
        ),
        SizedBox(width: 13.dp()),
        Text(
          "$quantity",
          style: widget.textStyle ?? textTheme.bodyMedium,
        ),
        SizedBox(width: 13.dp()),
        IconButtonWidget.withContainer(
          backgroundColor:
          widget.backgroundColor ?? colorScheme.inverseSurface,
          icon: Icons.add,
          height: widget.buttonSize ?? 22.dp(),
          width: widget.buttonSize ?? 22.dp(),
          iconSize: widget.iconSize ?? 20.dp(),
          iconColor: widget.iconColor ?? colorScheme.surface,
          onTap: () => _updateQuantity(1),
        ),
      ],
    );
  }
}
