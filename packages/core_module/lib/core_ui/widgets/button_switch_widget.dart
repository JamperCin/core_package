import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/dictionary_model.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/def/global_def.dart';

class ButtonSwitchWidget extends StatefulWidget {
  final List<DictionaryModel> list;
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
    required this.list,
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
    this.selectedButtonColor,
    this.fontSize,
  }) : withOutline = false;

  const ButtonSwitchWidget.withOutline({
    super.key,
    required this.list,
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
    this.selectedButtonColor,
    this.fontSize,
  }) : withOutline = true;

  @override
  State<ButtonSwitchWidget> createState() => _ButtonSwitchWidgetState();
}

class _ButtonSwitchWidgetState extends State<ButtonSwitchWidget> {
  RxList<DictionaryModel> items = <DictionaryModel>[].obs;

  @override
  void initState() {
    super.initState();
    items.value = widget.list;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return widget.withOutline
        ? ContainerWidget(
      borderColor: widget.borderColor ?? colorScheme.primary,
      borderWidth: widget.borderWidth ?? 1,
      borderRadius: widget.borderRadius ?? 0,
      height: widget.height ?? 50.dp(),
      width: widget.width ?? appDimen.screenWidth,
      color: widget.backgroundColor ?? Colors.transparent,
      padding: widget.padding ?? EdgeInsets.zero,
      child: Obx(
            () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [...items.map((e) => _childWithOutline(context, e))],
        ),
      ),
    )
        : ContainerWidget(
      borderColor: widget.borderColor ?? colorScheme.surfaceContainerLow,
      borderWidth: widget.borderWidth ?? 1,
      borderRadius: widget.borderRadius ?? 10,
      height: widget.height ?? 55.dp(),
      width: widget.width ?? appDimen.screenWidth,
      color: widget.backgroundColor ?? colorScheme.surfaceContainerLow,
      padding: widget.padding ?? EdgeInsets.all(1.dp()),
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
        style: widget.textStyle ??
            textTheme.bodyMedium?.copyWith(
              color: widget.unSelectedTextColor ?? colorScheme.tertiary,
            ),
        textColor: widget.unSelectedTextColor ?? colorScheme.tertiary,
        onTap: () {
          widget.onTap?.call(model);
          items.value = items
              .map((e) => e.copyWith(selected: e.key == model.key))
              .toList();
        },
      ),
    );

    final buttonWidget = ButtonWidget(
      backgroundColor: widget.selectedButtonColor ?? colorScheme.surfaceContainerHigh,
      text: model.value,
      height: widget.height ?? 55.dp(),
      borderRadius: widget.borderRadius ?? 10,
      textColor: widget.selectedColor ?? colorScheme.tertiary,
      onTap: () {
        widget.onTap?.call(model);
        items.value =
            items.map((e) => e.copyWith(selected: e.key == model.key)).toList();
      },
    );

    return Expanded(
      flex: 1,
      child: (model.selected ? buttonWidget : textWidget),
    );
  }

  Widget _childWithOutline(BuildContext context, DictionaryModel model) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final buttonWithOutlineWidget = ContainerWidget(
      borderColor: widget.selectedButtonColor ??
          (model.selected ? colorScheme.primary : Colors.transparent),
      color: widget.selectedButtonColor ??
          (model.selected ? colorScheme.primary : Colors.transparent),
      height: widget.height ?? 50.dp(),
      width: appDimen.screenWidth,
      borderRadius: 0,
      onTap: () {
        widget.onTap?.call(model);
        items.value =
            items.map((e) => e.copyWith(selected: e.key == model.key)).toList();
      },
      child: Center(
          child: Text(
            model.value,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: widget.fontSize,
              color: model.selected
                  ? (widget.selectedColor ?? colorScheme.tertiary)
                  : (widget.unSelectedTextColor ?? colorScheme.inverseSurface),
            ),
          )),
    );

    return Flexible(flex: 1, child: buttonWithOutlineWidget);
  }
}
