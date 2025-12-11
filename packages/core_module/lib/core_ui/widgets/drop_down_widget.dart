import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';

import '../../core_module.dart';
import 'container_widget.dart';

class DropDownWidget<T> extends StatefulWidget {
  final T? initialItem;
  final List<T> list;
  final Widget Function(T value)? builder;
  final ValueChanged<T>? onItemSelected;
  final double? height;
  final int? elevation;
  final double? horizontalPadding;
  final double? underlineThickness;
  final double? iconSize;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color? dropDownBackgroundColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? underlineColor;
  final TextStyle? textStyle;

  const DropDownWidget({
    super.key,
    this.initialItem,
    required this.list,
    this.builder,
    this.height,
    this.horizontalPadding,
    this.padding,
    this.margin,
    this.borderColor,
    this.textStyle,
    this.iconSize,
    this.iconColor,
    this.underlineColor,
    this.elevation,
    this.underlineThickness,
    this.onItemSelected,
    this.borderRadius,
    this.backgroundColor,
    this.dropDownBackgroundColor,
  });

  @override
  State<DropDownWidget<T>> createState() => _DropDownWidgetState<T>();
}

class _DropDownWidgetState<T> extends State<DropDownWidget<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialItem ?? (widget.list.isNotEmpty ? widget.list.first : null);
  }

  void _onItemChanged(T? newValue) {
    if (newValue == null) return;
    setState(() {
      _selectedItem = newValue;
    });
    widget.onItemSelected?.call(newValue);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ContainerWidget(
      padding: widget.padding ??
          EdgeInsets.symmetric(horizontal: widget.horizontalPadding ?? 10.dp()),
      height: widget.height ?? 40.dp(),
      margin: widget.margin ?? EdgeInsets.only(right: 5.dp()),
      borderRadius: widget.borderRadius ?? 10.dp(),
      color: widget.backgroundColor ?? colorScheme.surface,
      borderColor: widget.borderColor ?? colorScheme.inverseSurface,
      child: DropdownButton<T>(
        value: _selectedItem,
        icon: Icon(
          Icons.arrow_drop_down,
          color: widget.iconColor ?? colorScheme.inverseSurface,
          size: widget.iconSize ?? 24.dp(),
        ),
        iconSize: widget.iconSize ?? 24.dp(),
        elevation: widget.elevation ?? 16,
        style: widget.textStyle ??
            textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
        underline: Container(
          height: widget.underlineThickness ?? 0,
          color: widget.underlineColor ?? Colors.transparent,
        ),
        dropdownColor: widget.dropDownBackgroundColor ?? colorScheme.surfaceContainerHighest,
        onChanged: _onItemChanged,
        items: widget.list.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: widget.builder != null
                ? widget.builder!(value)
                : Text(
              "$value",
              style: widget.textStyle ?? textTheme.bodyMedium,
            ),
          );
        }).toList(),
      ),
    );
  }
}
