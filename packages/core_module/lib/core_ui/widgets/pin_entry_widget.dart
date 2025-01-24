import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PinEntryWidget extends StatelessWidget {
  final RxString pin;
  final int codeLength;
  final bool boxDecor;
  final Function(String)? onCodeSubmitted;

  PinEntryWidget({
    super.key,
    this.codeLength = 4,
    this.boxDecor = true,
    this.onCodeSubmitted,
  }) : pin = ''.obs;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(
      () => PinFieldAutoFill(
        decoration: boxDecor
            ? BoxLooseDecoration(
                textStyle: TextStyle(
                    fontSize: appDimen.dimen(24), color: Colors.black),
                strokeColorBuilder: focusNode.hasFocus
                    ? FixedColorBuilder(colorScheme.primary)
                    : FixedColorBuilder(colorScheme.inverseSurface),
              )
            : UnderlineDecoration(
                textStyle: TextStyle(
                    fontSize: appDimen.dimen(24), color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
        currentCode: pin.value,
        codeLength: codeLength,
        focusNode: focusNode,
        autoFocus: true,
        onCodeSubmitted: onCodeSubmitted,
        onCodeChanged: (code) {
          pin.value = code!;
          if (code.length == (codeLength)) {
            focusNode.unfocus();
            if (onCodeSubmitted != null) onCodeSubmitted!(code);
          }
        },
      ),
    );
  }
}
