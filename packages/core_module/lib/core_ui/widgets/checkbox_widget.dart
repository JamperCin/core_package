import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_definitions.dart';

class CheckboxWidget extends StatelessWidget {
  final String text;
  final bool checkValue;
  final bool enable;
  final Widget? textWidget;
  final TextStyle? style;
  final Function(bool) onChange;
  final GestureDetector? onTextClick;

  const CheckboxWidget({
    super.key,
    this.text = '',
    this.checkValue = false,
    this.enable = true,
    this.textWidget,
    this.onTextClick,
    required this.onChange,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    RxBool isChecked = false.obs;
    isChecked.value = checkValue;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(
      () => Row(
        children: [
          Flexible(
            flex: 0,
            child: Checkbox.adaptive(
              activeColor: colorScheme.primary,
              checkColor: colorScheme.tertiary,
              focusColor: colorScheme.secondary,
              side: BorderSide(
                color: isChecked.value
                    ? colorScheme.primary
                    : colorScheme.inverseSurface,
                width: 1,
              ),
              value: isChecked.value,
              onChanged: (value) {
                if (enable) {
                  isChecked.value = value!;
                  onChange(value);
                }
              },
            ),
          ),
          text.isNotEmpty
              ? Flexible(
                  flex: 1,
                  child: text.isNotEmpty || textWidget != null
                      ? GestureDetector(
                          onTap: () {
                            if (onTextClick != null) onTextClick!;
                          },
                          child: textWidget ??
                              Text(text, style: style ?? textTheme.labelMedium))
                      : const SizedBox.shrink(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
