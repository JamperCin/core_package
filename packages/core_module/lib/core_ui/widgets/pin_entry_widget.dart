import 'package:core_module/core/extensions/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PinEntryWidget extends StatefulWidget {
  final int codeLength;
  final bool boxDecor;
  final Color? textColor;
  final double? fontSize;
  final Color? borderColor;
  final Color? filledColor;
  final TextStyle? textStyle;
  final Function(String)? onCodeSubmitted;
  final Function(String)? onCodeChanged;

  const PinEntryWidget({
    super.key,
    this.codeLength = 4,
    this.boxDecor = true,
    this.onCodeSubmitted,
    this.textStyle,
    this.textColor,
    this.borderColor,
    this.filledColor,
    this.fontSize, this.onCodeChanged,
  });

  @override
  State<PinEntryWidget> createState() => PinEntryWidgetState();
}

class PinEntryWidgetState extends State<PinEntryWidget> {
  String pin = "";
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  /// Method to clear the entered pin externally
  void clearPin() {
    setState(() {
      pin = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PinFieldAutoFill(
      decoration: widget.boxDecor
          ? BoxLooseDecoration(
        textStyle: widget.textStyle ??
            TextStyle(
              fontSize: widget.fontSize ?? 20.dp(),
              color: widget.textColor ?? colorScheme.inverseSurface,
            ),
        bgColorBuilder: FixedColorBuilder(
            widget.filledColor ?? colorScheme.surface),
        strokeColorBuilder: focusNode.hasFocus
            ? FixedColorBuilder(colorScheme.primary)
            : FixedColorBuilder(
            widget.borderColor ?? colorScheme.inverseSurface),
      )
          : UnderlineDecoration(
        textStyle: widget.textStyle ??
            TextStyle(
              fontSize: widget.fontSize ?? 20.dp(),
              color: widget.textColor ?? colorScheme.inverseSurface,
            ),
        colorBuilder: focusNode.hasFocus
            ? FixedColorBuilder(colorScheme.primary)
            : FixedColorBuilder(
            widget.borderColor ?? colorScheme.inverseSurface),
        bgColorBuilder: FixedColorBuilder(
            widget.filledColor ?? colorScheme.surface),
      ),
      currentCode: pin,
      codeLength: widget.codeLength,
      focusNode: focusNode,
      autoFocus: true,
      onCodeSubmitted: widget.onCodeSubmitted,
      onCodeChanged: (code) {
        widget.onCodeChanged?.call(code ?? '');
        setState(() {
          pin = code ?? "";
        });
        if (code != null && code.length == widget.codeLength) {
          widget.onCodeSubmitted?.call(code);
          FocusScope.of(context).unfocus();
        }

      },
    );
  }
}
