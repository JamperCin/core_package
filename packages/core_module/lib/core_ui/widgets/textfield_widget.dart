import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool isEnabled;
  Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPhoneNumber;
  final double borderRadius;
  final double? width;
  final double? height;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? focusColor;
  final Color? counterColor;
  final Color? unFocusColor;
  final Color? disabledColor;
  final String? hintText;
  final String labelText;
  final String obscuringCharacter;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? counterStyle;
  TextInputType? keyboardType;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin;
  RxBool? obscureText;
  final VoidCallback? onTap;
  final FocusNode? focusNode;

  TextFieldWidget({
    super.key,
    this.controller,
    this.isEnabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.borderColor,
    this.focusColor,
    this.borderRadius = 10,
    this.hintText,
    this.style,
    this.hintStyle,
    this.onTap,
    this.labelText = '',
    this.backgroundColor,
    this.labelStyle,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.words,
    this.margin,
    this.unFocusColor,
    this.disabledColor,
    this.maxLength,
    this.onChanged,
    this.maxLines,
    this.textAlign,
    this.textInputAction,
    this.focusNode,
    this.height,
    this.counterColor,
    this.counterStyle,
  })  : obscureText = null,
        isPhoneNumber = false,
        inputFormatters = null,
        obscuringCharacter = "*";

  TextFieldWidget.withPhoneNumber({
    super.key,
    this.controller,
    this.isEnabled = true,
    this.suffixIcon,
    this.width,
    this.borderColor,
    this.focusColor,
    this.borderRadius = 10,
    this.hintText,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.onTap,
    this.labelText = '',
    this.backgroundColor,
    this.margin,
    this.unFocusColor,
    this.disabledColor,
    this.maxLength,
    this.onChanged,
    this.maxLines,
    this.textAlign,
    this.textInputAction,
    this.focusNode,
    this.height,
    this.counterColor,
    this.counterStyle,
  })  : obscureText = null,
        keyboardType = TextInputType.phone,
        isPhoneNumber = true,
        prefixIcon = AssetImageWidget(
          asset: icMobile,
          width: appDimen.dimen(14),
          height: appDimen.dimen(14),
        ),
        inputFormatters = [FilteringTextInputFormatter.digitsOnly],
        obscuringCharacter = "*";

  TextFieldWidget.withPassword({
    super.key,
    this.controller,
    this.isEnabled = true,
    this.suffixIcon,
    this.borderColor,
    this.focusColor,
    this.width,
    this.borderRadius = 10,
    this.hintText,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.onTap,
    this.labelText = '',
    this.backgroundColor,
    this.prefixIcon,
    this.margin,
    this.unFocusColor,
    this.disabledColor,
    this.maxLength,
    this.onChanged,
    this.maxLines,
    this.textAlign,
    this.textInputAction,
    this.focusNode,
    this.height,
    this.counterColor,
    this.counterStyle,
  })  : obscuringCharacter = "*",
        keyboardType = TextInputType.visiblePassword,
        isPhoneNumber = false,
        inputFormatters = null,
        obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    if (obscureText != null) {
      prefixIcon = prefixIcon ??
          AssetImageWidget(
            asset: icPassword,
            width: appDimen.dimen(14),
            height: appDimen.dimen(14),
          );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText.isNotEmpty)
          Text(labelText,
              style: labelStyle ??
                  Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w400)),
        if (labelText.isNotEmpty) SizedBox(height: appDimen.dimen(3.0)),
        SizedBox(
          width: width ?? appDimen.screenWidth,
          height: height ?? appDimen.dimen(60),
          child: obscureText != null
              ? Obx(() => _textField(context))
              : _textField(context),
        ),
      ],
    );
  }

  Widget _textField(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextFormField(
        enabled: isEnabled,
        focusNode: focusNode,
        controller: controller,
        textAlign: textAlign ?? TextAlign.left,
        obscureText: obscureText != null && obscureText!.value,
        style: style ?? Theme.of(context).textTheme.labelMedium,
        textInputAction: textInputAction ?? TextInputAction.go,
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(appDimen.dimen(8)),
                  child: prefixIcon,
                )
              : prefixIcon,
          suffixIcon: obscureText != null
              ? Padding(
                  padding: EdgeInsets.all(appDimen.dimen(8)),
                  child: AssetImageWidget(
                    height: appDimen.dimen(6),
                    width: appDimen.dimen(6),
                    asset: obscureText!.value ? icEyeSvg : icEyeClosedSvg,
                    assetColor: Theme.of(context).colorScheme.inverseSurface,
                    onTap: () {
                      if (obscureText != null) {
                        obscureText!.value = !(obscureText!.value);
                      }
                    },
                  ),
                )
              : suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ?? Theme.of(context).textTheme.labelSmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor ?? Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: disabledColor ?? Theme.of(context).colorScheme.secondary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: unFocusColor ?? Theme.of(context).colorScheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusColor ?? Theme.of(context).colorScheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          filled: true,
          fillColor: backgroundColor ?? Theme.of(context).colorScheme.tertiary,
          counterStyle: counterStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: counterColor ?? Theme.of(context).colorScheme.primary),
        ),
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
      ),
    );
  }

  ///Explanation of the border colors:
//enabledBorder: Sets the border color when the TextField is not focused.
// focusedBorder: Sets the border color when the TextField is focused.
// errorBorder: Sets the border color when an error occurs.
// focusedErrorBorder: Sets the border color when focused but with an error.
}
