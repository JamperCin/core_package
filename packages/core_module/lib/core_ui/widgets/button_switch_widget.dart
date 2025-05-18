import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/dictionary_model.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/def/global_def.dart';

class ButtonSwitchWidget extends StatelessWidget {
  final RxList<DictionaryModel> items;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? selectedButtonColor;
  final Color? unSelectedTextColor;
  final Color? borderColor;
  final bool withOutline;
  final double? borderWidth;
  final double? fontSize;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Function(DictionaryModel)? onTap;

  const ButtonSwitchWidget({
    super.key,
    required this.items,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.selectedColor,
    this.unSelectedTextColor,
    this.onTap,
    this.textStyle,
    this.height,
    this.width,
    this.selectedButtonColor, this.fontSize,
  }) : withOutline = false;

  const ButtonSwitchWidget.withOutline({
    super.key,
    required this.items,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.selectedColor,
    this.unSelectedTextColor,
    this.onTap,
    this.textStyle,
    this.height,
    this.width,
    this.selectedButtonColor, this.fontSize,
  }) : withOutline = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return withOutline
        ? ContainerWidget(
            borderColor: borderColor ?? colorScheme.primary,
            borderWidth: borderWidth ?? 1,
            borderRadius: borderRadius ?? 0,
            height: height ?? 50.dp(),
            width: width ?? appDimen.screenWidth,
            color: backgroundColor ?? Colors.transparent,
            padding: padding ?? EdgeInsets.zero,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [...items.map((e) => _childWithOutline(context, e))],
              ),
            ),
          )
        : ContainerWidget(
            borderColor: borderColor ?? colorScheme.onInverseSurface,
            borderWidth: borderWidth ?? 1,
            borderRadius: borderRadius ?? 10,
            height: height ?? 55.dp(),
            width: width ?? appDimen.screenWidth,
            color: backgroundColor ?? colorScheme.onInverseSurface,
            padding: padding ?? EdgeInsets.all(1.dp()),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [...items.map((e) => _childWidget(context, e))],
              ),
            ),
          );
  }

  Widget _childWidget(BuildContext context, DictionaryModel model) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final textWidget = Center(
      child: TextButtonWidget(
        text: model.value,
        style: textStyle ??
            textTheme.bodyMedium?.copyWith(
              color: unSelectedTextColor ?? colorScheme.tertiary,
            ),
        textColor: unSelectedTextColor ?? colorScheme.tertiary,
        onTap: () {
          onTap?.call(model);
          items.value = items
              .map((e) => e.copyWith(selected: e.key == model.key))
              .toList();
        },
      ),
    );

    final buttonWidget = ButtonWidget(
      backgroundColor: selectedButtonColor ?? colorScheme.surfaceBright,
      text: model.value,
      height: height ?? 55.dp(),
      borderRadius: borderRadius ?? 10,
      textColor: selectedColor ?? colorScheme.surface,
      onTap: () {
        onTap?.call(model);
        items.value =
            items.map((e) => e.copyWith(selected: e.key == model.key)).toList();
      },
    );

    return Flexible(
      flex: 1,
      child: (model.selected ? buttonWidget : textWidget),
    );
  }

  Widget _childWithOutline(BuildContext context, DictionaryModel model) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final buttonWithOutlineWidget = ContainerWidget(
      borderColor: selectedButtonColor ??
          (model.selected ? colorScheme.primary : Colors.transparent),
      color: selectedButtonColor ??
          (model.selected ? colorScheme.primary : Colors.transparent),
      height: height ?? 50.dp(),
      width: appDimen.screenWidth,
      borderRadius: 0,
      onTap: () {
        onTap?.call(model);
        items.value =
            items.map((e) => e.copyWith(selected: e.key == model.key)).toList();
      },
      child: Center(
          child: Text(
        model.value,
        style: textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
          color: model.selected
              ? (selectedColor ?? colorScheme.surface)
              : (unSelectedTextColor ?? colorScheme.inverseSurface),
        ),
      )),
    );

    return Flexible(flex: 1, child: buttonWithOutlineWidget);
  }
}
