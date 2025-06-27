import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/src/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

import '../../core/enum/country_picker_type.dart';
import '../snippets/country_picker/country_picker.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool isEnabled;
  final Widget? prefixIcon;
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
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? focusColor;
  final Color? countryDividerColor;
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
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? margin;
  final bool isPassword;
  final VoidCallback? onTap;
  final Function(CountryModel?)? onCountrySelected;
  final FocusNode? focusNode;

  // const TextFieldWidget({
  //   super.key,
  //   this.controller,
  //   this.isEnabled = true,
  //   this.prefixIcon,
  //   this.suffixIcon,
  //   this.width,
  //   this.borderColor,
  //   this.focusColor,
  //   this.borderRadius = 10,
  //   this.hintText,
  //   this.style,
  //   this.hintStyle,
  //   this.onTap,
  //   this.labelText = '',
  //   this.backgroundColor,
  //   this.labelStyle,
  //   this.keyboardType = TextInputType.text,
  //   this.textCapitalization = TextCapitalization.words,
  //   this.margin,
  //   this.unFocusColor,
  //   this.disabledColor,
  //   this.maxLength,
  //   this.onChanged,
  //   this.maxLines,
  //   this.textAlign,
  //   this.textInputAction,
  //   this.focusNode,
  //   this.height,
  //   this.counterColor,
  //   this.counterStyle,
  //   this.hasCountryPicker = false,
  //   this.countryDividerColor,
  //   this.pickerRightMargin,
  //   this.countrySearchTextStyle,
  //   this.countryTextStyle,
  //   this.countryWidgetTextStyle,
  //   this.countryWidgetWidth,
  //   this.countryPickerType,
  //   this.countryDropDownIconSize,
  //   this.phoneCodeTextStyle,
  //   this.countryDropDownIconColor,
  //   this.modalTitleTextStyle,
  //   this.onCountrySelected,
  //   this.countrySearchHintText,
  //   this.countryWidgetHintText,
  //   this.inputFormatters,
  //   this.obscuringCharacter = '*',
  //   this.isPassword = false, this.onFieldSubmitted,
  // });

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
    this.onFieldSubmitted,
  })  : hasCountryPicker = false,
        inputFormatters = null,
        countryDividerColor = null,
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
        isPassword = false,
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
    this.countryDividerColor,
    this.onFieldSubmitted,
  })  : keyboardType = TextInputType.phone,
        textCapitalization = TextCapitalization.none,
        isPassword = false,
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
    this.onFieldSubmitted,
    this.obscuringCharacter = "*",
  })  :
        isPassword = true,
        keyboardType = TextInputType.visiblePassword,
        textCapitalization = TextCapitalization.none,
        hasCountryPicker = false,
        inputFormatters = null,
        pickerRightMargin = null,
        modalTitleTextStyle = null,
        countryDropDownIconSize = null,
        countryDropDownIconColor = null,
        phoneCodeTextStyle = null,
        countryWidgetWidth = null,
        countryDividerColor = null,
        countrySearchHintText = null,
        countryWidgetTextStyle = null,
        countrySearchTextStyle = null,
        countryPickerType = null,
        onCountrySelected = null,
        countryTextStyle = null,
        countryWidgetHintText = null;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late RxBool obscureText;
  final Rx<CountryModel> _selectedCountry = const CountryModel().obs;
  late Widget prefixIcon;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword ? true.obs : false.obs;

    prefixIcon = widget.prefixIcon ?? const SizedBox.shrink();

    if (widget.isPassword) {
      prefixIcon = widget.prefixIcon ??
          AssetImageWidget(
            asset: icPassword,
            width: appDimen.dimen(14),
            height: appDimen.dimen(14),
          );
    }

    if (widget.keyboardType == TextInputType.phone) {
      prefixIcon = widget.prefixIcon ??
          AssetImageWidget(
            asset: icMobile,
            width: appDimen.dimen(14),
            height: appDimen.dimen(14),
          );
    }

  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty)
          Text(
            widget.labelText,
            style: widget.labelStyle ??
                textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colorScheme.inverseSurface,
                ),
          ),
        if (widget.labelText.isNotEmpty) SizedBox(height: appDimen.dimen(3.0)),
        SizedBox(
          width: widget.width ?? appDimen.screenWidth,
          height: widget.height ?? appDimen.dimen(60),
          child: widget.isPassword
              ? Obx(() => _buildTextField(context))
              : widget.hasCountryPicker
                  ? _buildTextFieldWithCountryPicker(context)
                  : _buildTextField(context),
        ),
      ],
    );
  }

  Widget _buildTextField(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      enabled: widget.isEnabled,
      focusNode: widget.focusNode,
      controller: widget.controller,
      textAlign: widget.textAlign ?? TextAlign.left,
      obscureText: widget.isPassword ? obscureText.value : false,
      style: widget.style ??
          textTheme.labelMedium?.copyWith(color: colorScheme.inverseSurface),
      textInputAction: widget.textInputAction ?? TextInputAction.go,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 5.dp(),vertical: 3.dp()),
          child: prefixIcon,
        ),
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () => obscureText.value = !obscureText.value,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 6.dp(),vertical: 4.dp()),
                  child: AssetImageWidget(
                    height: 10.dp(),
                    width: 10.dp(),
                    asset: obscureText.value ? icEyeSvg : icEyeClosedSvg,
                    assetColor: colorScheme.inverseSurface,
                  ),
                ),
              )
            : widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            textTheme.labelSmall?.copyWith(color: colorScheme.inverseSurface),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:
              BorderSide(color: widget.borderColor ?? colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:
              BorderSide(color: widget.unFocusColor ?? colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:
              BorderSide(color: widget.focusColor ?? colorScheme.primary),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide:
              BorderSide(color: widget.disabledColor ?? colorScheme.secondary),
        ),
        filled: true,
        fillColor: widget.backgroundColor ?? colorScheme.surface,
        counterStyle: widget.counterStyle ??
            textTheme.bodyMedium
                ?.copyWith(color: widget.counterColor ?? colorScheme.primary),
      ),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.words,
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
    );
  }

  Widget _buildTextFieldWithCountryPicker(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Obx(
          () => SizedBox(
            width: widget.countryWidgetWidth ?? 105.dp(),
            child: InkWell(
              onTap: () async {
                CountryPicker(
                  context,
                  onCountrySelected: (country) {
                    _selectedCountry.value = country ?? const CountryModel();
                    widget.onCountrySelected?.call(country);
                  },
                  searchTextStyle: widget.countrySearchTextStyle,
                  textStyle: widget.countryTextStyle,
                  countryPickerType:
                      widget.countryPickerType ?? CountryPickerType.modalStyle,
                  searchHint: widget.countrySearchHintText,
                  dividerColor: widget.countryDividerColor,
                  phoneCodeTextStyle: widget.phoneCodeTextStyle,
                  modalTitleTextStyle: widget.modalTitleTextStyle,
                );
              },
              child: TextFormField(
                enabled: false,
                textAlign: widget.textAlign ?? TextAlign.center,
                style: widget.countryWidgetTextStyle ??
                    textTheme.labelMedium
                        ?.copyWith(color: colorScheme.inverseSurface),
                controller: TextEditingController(
                  text: _selectedCountry.value.phoneCode.isNotEmpty
                      ? "+${_selectedCountry.value.phoneCode}"
                      : '',
                ),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.arrow_drop_down_outlined,
                    size: widget.countryDropDownIconSize ?? 30.dp(),
                    color: widget.countryDropDownIconColor ??
                        colorScheme.surfaceBright,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                        color: widget.borderColor ?? colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                        color: widget.unFocusColor ?? colorScheme.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                        color: widget.focusColor ?? colorScheme.primary),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: BorderSide(
                        color: widget.disabledColor ?? colorScheme.primary),
                  ),
                  filled: true,
                  fillColor: widget.backgroundColor ?? colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: widget.pickerRightMargin ?? 6.dp()),
        Expanded(child: _buildTextField(context)),
      ],
    );
  }

  ///Explanation of the border colors:
//enabledBorder: Sets the border color when the TextField is not focused.
// focusedBorder: Sets the border color when the TextField is focused.
// errorBorder: Sets the border color when an error occurs.
// focusedErrorBorder: Sets the border color when focused but with an error.
}
