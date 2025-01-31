import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool isEnabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPhoneNumber;
  final double borderRadius;
  final double? width;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? focusColor;
  final String? hintText;
  final String labelText;
  final String obscuringCharacter;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  TextInputType? keyboardType;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin;
  RxBool? obscureText;
  final VoidCallback? onTap;

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
    this.margin,
  })  : obscuringCharacter = "*",
        keyboardType = TextInputType.visiblePassword,
        isPhoneNumber = false,
        prefixIcon = AssetImageWidget(
          asset:icPassword,
          width: appDimen.dimen(14),
          height: appDimen.dimen(14),
        ),
        inputFormatters = null,
        obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText.isNotEmpty)
          Text(labelText,
              style: labelStyle ?? Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.w400)),
        if (labelText.isNotEmpty) SizedBox(height: appDimen.dimen(3.0)),
        Container(
          width: width ?? appDimen.screenWidth,
          height: appDimen.dimen(60),
          padding: EdgeInsets.zero,
          margin: margin ?? EdgeInsets.zero,
          decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(borderRadius),
              right: Radius.circular(borderRadius),
            ),
            border: Border.all(
              color: borderColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
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
        controller: controller,
        obscureText: obscureText != null && obscureText!.value,
        style: style ?? Theme.of(context).textTheme.labelMedium,
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
              color: borderColor ?? Theme.of(context).colorScheme.secondary,
              width: 1,
            ),
          ),
          // disabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: disabledColor ?? AppColors.black,
          //     width: .5,
          //   ),
          //   borderRadius: BorderRadius.circular(borderRadius),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: unFocusColor ?? AppColors.black,
          //     width: .5,
          //   ),
          //   borderRadius: BorderRadius.circular(borderRadius),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusColor ?? Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
        textInputAction: TextInputAction.go,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
      ),
    );
  }
}
