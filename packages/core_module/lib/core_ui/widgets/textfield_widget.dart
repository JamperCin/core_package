import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

import '../../core/enum/country_picker_type.dart';
import '../snippets/country_picker/country_picker.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool isEnabled;
  Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hasCountryPicker;
  final double borderRadius;
  final double? width;
  final double? countryWidgetWidth;
  final double? pickerRightMargin;
  final double? height;
  final double? countryDropDownIconSize;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? focusColor;
  final Color? countryDropDownIconColor;
  final Color? counterColor;
  final Color? unFocusColor;
  final Color? disabledColor;
  final String? hintText;
  final CountryPickerType? countryPickerType;
  final String? countryWidgetHintText;
  final String? countrySearchHintText;
  final TextStyle? phoneCodeTextStyle;
  final TextStyle? modalTitleTextStyle;
  final String labelText;
  final String obscuringCharacter;
  final TextStyle? style;
  final TextStyle? countryWidgetTextStyle;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? countrySearchTextStyle;
  final TextStyle? countryTextStyle;
  final TextStyle? counterStyle;
  TextInputType? keyboardType;
  TextCapitalization? textCapitalization;
  List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin;
  RxBool? obscureText;
  final VoidCallback? onTap;
  final Function(CountryModel?)? onCountrySelected;
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
        hasCountryPicker = false,
        inputFormatters = null,
        pickerRightMargin = null,
        countrySearchTextStyle = null,
        countryTextStyle = null,
        countryWidgetTextStyle = null,
        countryWidgetWidth = null,
        countryPickerType = null,
        countryDropDownIconSize = null,
        phoneCodeTextStyle = null,
        countryDropDownIconColor = null,
        modalTitleTextStyle = null,
        onCountrySelected = null,
        countrySearchHintText = null,
        countryWidgetHintText = null,
        obscuringCharacter = "*";

  TextFieldWidget.withPhoneNumber({
    super.key,
    this.controller,
    this.isEnabled = true,
    this.hasCountryPicker = false,
    this.countryWidgetWidth,
    this.suffixIcon,
    this.width,
    this.borderColor,
    this.focusColor,
    this.borderRadius = 10,
    this.pickerRightMargin,
    this.countryDropDownIconColor,
    this.hintText,
    this.style,
    this.hintStyle,
    this.labelStyle,
    this.countryDropDownIconSize,
    this.onTap,
    this.labelText = '',
    this.countryWidgetHintText = '',
    this.backgroundColor,
    this.margin,
    this.modalTitleTextStyle,
    this.unFocusColor,
    this.disabledColor,
    this.maxLength,
    this.onChanged,
    this.countryWidgetTextStyle,
    this.maxLines,
    this.countrySearchHintText,
    this.textAlign,
    this.countrySearchTextStyle,
    this.countryTextStyle,
    this.onCountrySelected,
    this.textInputAction,
    this.focusNode,
    this.height,
    this.phoneCodeTextStyle,
    this.countryPickerType,
    this.prefixIcon,
    this.counterColor,
    this.counterStyle,
  })  : obscureText = null,
        keyboardType = TextInputType.phone,
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
        hasCountryPicker = false,
        inputFormatters = null,
        pickerRightMargin = null,
        modalTitleTextStyle = null,
        countryDropDownIconSize = null,
        countryDropDownIconColor = null,
        phoneCodeTextStyle = null,
        countryWidgetWidth = null,
        countrySearchHintText = null,
        countryWidgetTextStyle = null,
        countrySearchTextStyle = null,
        countryPickerType = null,
        onCountrySelected = null,
        countryTextStyle = null,
        countryWidgetHintText = null,
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

    if (keyboardType == TextInputType.phone) {
      prefixIcon = prefixIcon ??
          AssetImageWidget(
            asset: icMobile,
            width: appDimen.dimen(14),
            height: appDimen.dimen(14),
          );
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText.isNotEmpty)
          Text(labelText,
              style: labelStyle ??
                  textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: colorScheme.inverseSurface,
                  )),
        if (labelText.isNotEmpty) SizedBox(height: appDimen.dimen(3.0)),
        SizedBox(
          width: width ?? appDimen.screenWidth,
          height: height ?? appDimen.dimen(60),
          child: obscureText != null
              ? Obx(() => _textField(context))
              : hasCountryPicker
                  ? _textFieldWithCountryPicker(context)
                  : _textField(context),
        ),
      ],
    );
  }

  Widget _textField(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: TextFormField(
        enabled: isEnabled,
        focusNode: focusNode,
        controller: controller,
        textAlign: textAlign ?? TextAlign.left,
        obscureText: obscureText != null && obscureText!.value,
        style: style ?? textTheme.labelMedium?.copyWith(color: colorScheme.inverseSurface),
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
                    assetColor: colorScheme.inverseSurface,
                    onTap: () {
                      if (obscureText != null) {
                        obscureText!.value = !(obscureText!.value);
                      }
                    },
                  ),
                )
              : suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ?? textTheme.labelSmall?.copyWith(color: colorScheme.inverseSurface),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor ?? colorScheme.primary,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: disabledColor ?? colorScheme.secondary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: unFocusColor ?? colorScheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusColor ?? colorScheme.primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          filled: true,
          fillColor: backgroundColor ?? colorScheme.surface,
          counterStyle: counterStyle ??
              textTheme.bodyMedium
                  ?.copyWith(color: counterColor ?? colorScheme.primary),
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

  final Rx<CountryModel> _selectedCountry = const CountryModel().obs;

  Widget _textFieldWithCountryPicker(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 0,
          child: Obx(
            () => SizedBox(
              width: countryWidgetWidth ?? 105.dp(),
              child: InkWell(
                onTap: () async {
                  CountryPicker(
                    context,
                    onCountrySelected: (country) {
                      _selectedCountry.value = country ?? const CountryModel();
                      onCountrySelected?.call(country);
                    },
                    searchTextStyle: countrySearchTextStyle,
                    textStyle: countryTextStyle,
                    countryPickerType:
                        countryPickerType ?? CountryPickerType.modalStyle,
                    searchHint: countrySearchHintText,
                    phoneCodeTextStyle: phoneCodeTextStyle,
                    modalTitleTextStyle: modalTitleTextStyle,
                  );
                },
                child: TextFormField(
                  enabled: false,
                  textAlign: textAlign ?? TextAlign.center,
                  style: countryWidgetTextStyle ??
                      textTheme.labelMedium
                          ?.copyWith(color: colorScheme.inverseSurface),
                  controller: TextEditingController(
                      text: _selectedCountry.value.phoneCode.isNotEmpty
                          ? "+${_selectedCountry.value.phoneCode}"
                          : ''),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.arrow_drop_down_outlined,
                      size: countryDropDownIconSize ?? 30.dp(),
                      color:
                          countryDropDownIconColor ?? colorScheme.surfaceBright,
                    ),
                    hintStyle: hintStyle ??
                        textTheme.labelSmall
                            ?.copyWith(color: colorScheme.surfaceBright),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                        color: borderColor ?? colorScheme.primary,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: disabledColor ?? colorScheme.primary,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: unFocusColor ?? colorScheme.primary,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: focusColor ?? colorScheme.primary,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    filled: true,
                    fillColor: backgroundColor ?? colorScheme.surface,
                    counterStyle: counterStyle ??
                        textTheme.bodyMedium?.copyWith(
                            color: counterColor ?? colorScheme.primary),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: pickerRightMargin ?? 6.dp()),
        Flexible(
          flex: 1,
          child: _textField(context),
        ),
      ],
    );
  }

  ///Explanation of the border colors:
//enabledBorder: Sets the border color when the TextField is not focused.
// focusedBorder: Sets the border color when the TextField is focused.
// errorBorder: Sets the border color when an error occurs.
// focusedErrorBorder: Sets the border color when focused but with an error.
}
