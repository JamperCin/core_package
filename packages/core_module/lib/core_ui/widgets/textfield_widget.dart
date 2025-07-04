import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/country_model.dart';
import 'package:core_module/core/utils/file_utils.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/src/app_module_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/src/assets_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

import '../../core/enum/country_picker_type.dart';
import '../snippets/country_picker/country_picker.dart';
import '../snippets/country_picker/res/country_codes.dart';

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
  final CountryPickerDecorationStyle? countryPickerDecorationStyle;
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

  ///Sample is GH, EU, etc
  final String? defaultCountryCode;
  final String? prefixAsset;
  final String? suffixAsset;

  const TextFieldWidget({
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
    this.prefixAsset,
    this.suffixAsset,
  })  : hasCountryPicker = false,
        inputFormatters = null,
        countryDividerColor = null,
        pickerRightMargin = null,
        countrySearchTextStyle = null,
        countryTextStyle = null,
        defaultCountryCode = null,
        countryWidgetTextStyle = null,
        countryWidgetWidth = null,
        countryPickerType = null,
        countryDropDownIconSize = null,
        phoneCodeTextStyle = null,
        countryPickerDecorationStyle = null,
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
    this.defaultCountryCode,
    this.phoneCodeTextStyle,
    this.countryPickerDecorationStyle,
    this.countryPickerType,
    this.prefixIcon,
    this.counterColor,
    this.counterStyle,
    this.countryDividerColor,
    this.onFieldSubmitted,
    this.prefixAsset,
    this.suffixAsset,
  })  : keyboardType = TextInputType.phone,
        textCapitalization = TextCapitalization.none,
        isPassword = false,
        inputFormatters = [FilteringTextInputFormatter.digitsOnly],
        obscuringCharacter = "*";

  const TextFieldWidget.withPassword({
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
    this.prefixAsset,
    this.suffixAsset,
  })  : isPassword = true,
        keyboardType = TextInputType.visiblePassword,
        textCapitalization = TextCapitalization.none,
        hasCountryPicker = false,
        inputFormatters = null,
        pickerRightMargin = null,
        defaultCountryCode = null,
        modalTitleTextStyle = null,
        countryDropDownIconSize = null,
        countryDropDownIconColor = null,
        phoneCodeTextStyle = null,
        countryPickerDecorationStyle = null,
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
  Widget? prefixIcon;
  Widget? suffixIcon;

  @override
  void initState() {
    super.initState();

    assert(
        !((widget.prefixAsset ?? '').isNotEmpty && widget.prefixIcon != null),
        'Both prefixAsset and prefixIcon cannot be present at the same time');

    assert(
        !((widget.suffixAsset ?? '').isNotEmpty && widget.suffixIcon != null),
        'Both suffixAsset and suffixIcon cannot be present at the same time');

    obscureText = widget.isPassword ? true.obs : false.obs;

    prefixIcon = widget.prefixIcon;
    suffixIcon = widget.suffixIcon;

    if (widget.isPassword) {
      prefixIcon = widget.prefixIcon ??
          AssetImageWidget(
            asset: widget.prefixAsset ?? icPassword,
            width: appDimen.dimen(14),
            height: appDimen.dimen(14),
          );
    }

    if (widget.keyboardType == TextInputType.phone) {
      prefixIcon = widget.prefixIcon ??
          AssetImageWidget(
            asset: widget.prefixAsset ?? icMobile,
            width: appDimen.dimen(14),
            height: appDimen.dimen(14),
          );
    }

    if (widget.prefixAsset != null && widget.prefixAsset!.isNotEmpty) {
      prefixIcon = AssetImageWidget(
        asset: widget.prefixAsset!,
        width: appDimen.dimen(14),
        height: appDimen.dimen(14),
      );
    }

    if (widget.suffixAsset != null && widget.suffixAsset!.isNotEmpty) {
      suffixIcon = AssetImageWidget(
        asset: widget.suffixAsset!,
        width: appDimen.dimen(14),
        height: appDimen.dimen(14),
      );
    }

    prefixIcon = widget.prefixIcon is SizedBox ? null : prefixIcon;

    debugPrint("suffix -> $suffixIcon");
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
        prefixIcon: prefixIcon != null
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.dp(), vertical: 6.dp()),
                child: prefixIcon,
              )
            : null,
        suffixIcon: widget.isPassword && suffixIcon == null
            ? GestureDetector(
                onTap: () => obscureText.value = !obscureText.value,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8.dp(), vertical: 6.dp()),
                  child: AssetImageWidget(
                    height: 10.dp(),
                    width: 10.dp(),
                    asset: obscureText.value ? icEyeSvg : icEyeClosedSvg,
                    assetColor: colorScheme.inverseSurface,
                  ),
                ),
              )
            : suffixIcon != null && suffixIcon is! SizedBox
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.dp(), vertical: 6.dp()),
                    child: suffixIcon,
                  )
                : null,
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

  ///Check if default country code is set and apply it to the selected country
  Future<CountryModel?> _initDefaultCountry() async {
    final countryList = await FileUtils().fetchListWithPreList<CountryModel>(
      listMap: countryCodes,
      parser: (json) {
        return CountryModel.fromJson(json);
      },
    );
    return countryList.firstWhereOrNull(
        (element) => element.countryCode == widget.defaultCountryCode);
  }

  Widget _buildTextFieldWithCountryPicker(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    if (widget.defaultCountryCode != null) {
      _initDefaultCountry().then((country) {
        if (country != null) {
          _selectedCountry.value = country;
          widget.onCountrySelected?.call(country);
        }
      });
    }

    if (widget.countryPickerDecorationStyle ==
        CountryPickerDecorationStyle.continuous) {
      prefixIcon = SizedBox(
        width: 110.dp(),
        child: Obx(
          () => InkWell(
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
            child: Row(
              children: [
                SizedBox(
                  // the conditional 50 prevents irregularities caused by the flags in RTL mode
                  width: 85.dp(),
                  child: FutureBuilder(
                    future: FileUtils.countryCodeToEmoji(
                        _selectedCountry.value.countryCode),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      String data = snapshot.hasData
                          ? snapshot.data!
                          : CountryModel.worldWide.countryCode;
                      return Row(
                        children: [
                          Text(
                            data == CountryModel.worldWide.countryCode
                                ? '\uD83C\uDF0D'
                                : data,
                            style: textTheme.bodyMedium,
                          ),
                          Gap(5.dp()),
                          if (_selectedCountry.value.phoneCode.isNotEmpty)
                            Text(
                              '${isRtl ? '' : '+'}${_selectedCountry.value.phoneCode}${isRtl ? '+' : ''}',
                              style: widget.style ?? textTheme.bodyMedium,
                            ),
                        ],
                      );
                    },
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: widget.countryDropDownIconSize ?? 30.dp(),
                  color: widget.countryDropDownIconColor ??
                      colorScheme.surfaceBright,
                ),
              ],
            ),
          ),
        ),
      );
      return _buildTextField(context);
    }

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
