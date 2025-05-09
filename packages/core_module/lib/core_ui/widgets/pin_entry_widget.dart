import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PinEntryWidget extends StatelessWidget {
  String pin = "";
  final int codeLength;
  final bool boxDecor;
  final Color? textColor;
  final double? fontSize;
  final Color? borderColor;
  final Color? filledColor;
  final TextStyle? textStyle;
  final Function(String)? onCodeSubmitted;

  PinEntryWidget({
    super.key,
    this.codeLength = 4,
    this.boxDecor = true,
    this.onCodeSubmitted,
    this.textStyle,
    this.textColor,
    this.borderColor,
    this.filledColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    final colorScheme = Theme.of(context).colorScheme;

    return PinFieldAutoFill(
      decoration: boxDecor
          ? BoxLooseDecoration(
        textStyle: textStyle ??
            TextStyle(
              fontSize: fontSize ?? 20.dp(),
              color: textColor ?? colorScheme.inverseSurface,
            ),
        bgColorBuilder:
        FixedColorBuilder(filledColor ?? colorScheme.surface),
        strokeColorBuilder: focusNode.hasFocus
            ? FixedColorBuilder(colorScheme.primary)
            : FixedColorBuilder(
            borderColor ?? colorScheme.inverseSurface),
      )
          : UnderlineDecoration(
        textStyle: textStyle ??
            TextStyle(
              fontSize: fontSize ?? 20.dp(),
              color: textColor ?? colorScheme.inverseSurface,
            ),
        colorBuilder: focusNode.hasFocus
            ? FixedColorBuilder(colorScheme.primary)
            : FixedColorBuilder(
            borderColor ?? colorScheme.inverseSurface),
        bgColorBuilder:
        FixedColorBuilder(filledColor ?? colorScheme.surface),
      ),
      currentCode: pin,
      codeLength: codeLength,
      focusNode: focusNode,
      autoFocus: true,
      onCodeSubmitted: onCodeSubmitted,
      onCodeChanged: (code) {
        pin = code!;
        if (code.length == (codeLength)) {

          if (onCodeSubmitted != null) onCodeSubmitted!(code);
          FocusScope.of(context).unfocus();
        }
      },
    );
  }
}
