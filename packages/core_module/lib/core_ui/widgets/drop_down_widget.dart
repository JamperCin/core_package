import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';

import '../../core_module.dart';
import 'container_widget.dart';

class DropDownWidget<T> extends StatelessWidget {
  final Rx<T> selectedItem;
  final List<T> list;
  final Widget Function(T value)? builder;
  final Function(T item)? onItemSelected;
  final double? height;
  final int? elevation;
  final double? horizontalPadding;
  final double? underlineThickness;
  final double? iconSize;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? borderColor;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? underlineColor;
  final TextStyle? textStyle;

  const DropDownWidget({
    super.key,
    required this.selectedItem,
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
    this.underlineThickness, this.onItemSelected, this.borderRadius, this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ContainerWidget(
      padding: padding ??
          EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10.dp()),
      height: height ?? 40.dp(),
      margin: margin ?? EdgeInsets.only(right: 5.dp()),
      borderRadius: borderRadius ?? 10.dp(),
      color: backgroundColor ?? colorScheme.surface,
      borderColor: borderColor ?? colorScheme.primary,
      child: Obx(
        () => DropdownButton<T>(
          value: selectedItem.value,
          icon: Icon(
            Icons.arrow_drop_down,
            color: iconColor ?? colorScheme.primary,
            size: iconSize ?? 24.dp(),
          ),
          iconSize: iconSize ?? 24.dp(),
          elevation: elevation ?? 16,
          style: textStyle ??
              textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
          underline: Container(
            height: underlineThickness ?? 0,
            color: underlineColor ?? Colors.transparent,
          ),
          onChanged: (T? newValue) {
            selectedItem.value = newValue as T;
            if(onItemSelected != null)onItemSelected!(selectedItem.value);
          },
          items: list.map<DropdownMenuItem<T>>((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: builder != null
                  ? builder!(value)
                  : Text(
                      "$value",
                      style: textStyle,
                    ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
