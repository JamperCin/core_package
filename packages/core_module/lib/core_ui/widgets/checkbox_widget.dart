import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckboxWidget extends StatelessWidget {
  final String text;
  final bool checkValue;
  final bool enable;
  final Widget? textWidget;
  final TextStyle? style;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? checkedValue;
  final Color? unCheckedValue;
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
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.checkedValue,
    this.unCheckedValue,
  });

  @override
  Widget build(BuildContext context) {
    RxBool isChecked = false.obs;
    isChecked.value = checkValue;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    assert(!(text.isNotEmpty && textWidget != null),
        'Both text and textWidget cannot be present at the same time');

    return Obx(
      () => Row(
        children: [
          Flexible(
            flex: 0,
            child: Checkbox.adaptive(
              activeColor: activeColor ?? colorScheme.primary,
              checkColor: checkColor ?? colorScheme.tertiary,
              focusColor: focusColor ?? colorScheme.secondary,
              side: BorderSide(
                color: isChecked.value
                    ? (checkedValue ?? colorScheme.primary)
                    : (unCheckedValue ?? colorScheme.inverseSurface),
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
          if (text.isNotEmpty)
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (onTextClick != null) onTextClick!;
                },
                child: Text(
                  text,
                  style: style ??
                      textTheme.labelMedium?.copyWith(
                        color: isChecked.value
                            ? (checkedValue ?? colorScheme.primary)
                            : (unCheckedValue ?? colorScheme.inverseSurface),
                      ),
                ),
              ),
            ),
          if (textWidget != null)
            Flexible(
              flex: 1,
              child: textWidget!,
            )
        ],
      ),
    );
  }
}
