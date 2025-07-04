import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/country_model.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/snippets/country_picker/country_picker_delegate.dart';
import 'package:core_module/core_ui/snippets/country_picker/res/country_codes.dart';
import 'package:flutter/material.dart';

import '../../../core/enum/country_picker_type.dart';
import '../../../src/assets_path.dart';
import '../../../core/utils/file_utils.dart';
import '../../widgets/bottom_sheet_widget.dart';
import '../../widgets/divider_widget.dart';
import '../../widgets/text_button_widget.dart';
import '../../widgets/textfield_widget.dart';
import 'country_localizations.dart';

class CountryPicker {
  late Future<List<CountryModel>> countryList;
  Rx<Future<List<CountryModel>>> filteredList = Rx(Future.value([]));

  final TextStyle? textStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintTextStyle;
  final TextStyle? phoneCodeTextStyle;
  final TextStyle? modalTitleTextStyle;
  final String? searchHint;
  final String? modalSearchTitle;
  final CountryPickerType? countryPickerType;
  final double? modalHeight;
  final EdgeInsetsGeometry? modalMargin;
  final Color? dividerColor;
  final BuildContext context;
  final Function(CountryModel?)? onCountrySelected;

  CountryPicker(
    this.context, {
    this.textStyle,
    this.countryPickerType,
    this.searchTextStyle,
    this.phoneCodeTextStyle,
    this.searchHint,
    this.modalSearchTitle,
    this.onCountrySelected,
    this.modalHeight,
    this.dividerColor,
    this.modalMargin,
    this.searchHintTextStyle,
    this.modalTitleTextStyle,
  }) {
    if (countryPickerType == CountryPickerType.modalStyle) {
      CountryPicker.showCountryPickerModalStyle(
        context,
        textStyle: textStyle,
        searchTextStyle: searchTextStyle,
        phoneCodeTextStyle: phoneCodeTextStyle,
        searchHint: searchHint,
        modalSearchTitle: modalSearchTitle,
        onCountrySelected: onCountrySelected,
        modalHeight: modalHeight,
        dividerColor: dividerColor,
        modalMargin: modalMargin,
        modalTitleTextStyle: modalTitleTextStyle,
        searchHintTextStyle: searchHintTextStyle,
      );
    } else {
      CountryPicker.showPicker(
        context,
        textStyle: textStyle,
        onCountrySelected: onCountrySelected,
        searchHint: searchHint,
        searchTextStyle: searchTextStyle,
        phoneCodeTextStyle: phoneCodeTextStyle,
        dividerColor: dividerColor,
      );
    }
  }

  ///Pick a country from the country picker normal style
  CountryPicker.showPicker(
    this.context, {
    this.textStyle,
    this.searchTextStyle,
    this.phoneCodeTextStyle,
    this.searchHint,
    this.dividerColor,
    this.onCountrySelected,
  })  : modalSearchTitle = null,
        modalMargin = null,
        modalTitleTextStyle = null,
        searchHintTextStyle = null,
        countryPickerType = null,
        modalHeight = null {
    showSearch(
      context: context,
      delegate: CountryPickerDelegate(
          context: context,
          textStyle: textStyle,
          searchHint: searchHint,
          searchTextStyle: searchTextStyle,
          phoneCodeTextStyle: phoneCodeTextStyle),
    ).then((location) {
      onCountrySelected?.call(location);
    });
  }

  CountryPicker.showCountryPickerModalStyle(
    this.context, {
    this.textStyle,
    this.searchTextStyle,
    this.phoneCodeTextStyle,
    this.searchHint,
    this.modalSearchTitle,
    this.onCountrySelected,
    this.modalHeight,
    this.modalTitleTextStyle,
    this.searchHintTextStyle,
    this.dividerColor,
    this.modalMargin,
  }) : countryPickerType = null {
    _initData();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    BottomSheetWidget(
      context: context,
      title: modalSearchTitle ?? 'Search Country',
      height: modalHeight ?? appDimen.screenHeight * 0.8,
      margin: modalMargin ?? EdgeInsets.symmetric(horizontal: 16.dp()),
      titleStyle: modalTitleTextStyle ??
          textTheme.bodyMedium?.copyWith(color: colorScheme.inverseSurface),
      color: colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.dp(), vertical: 16.dp()),
        child: Column(
          children: [
            DividerWidget(width: 70.dp(), height: 1.dp()),
            Gap(5.dp()),
            Text(modalSearchTitle ?? 'Search Country',
                style: modalTitleTextStyle ??
                    textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.inverseSurface)),
            Gap(10.dp()),
            _searchFieldWidget(),
            Gap(16.dp()),
            Expanded(
              child: Obx(
                () => FutureBuilder(
                  future: filteredList.value,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CountryModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: [
                          ...snapshot.data!.map((item) => _itemWidget(item)),
                        ],
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _initData() async {
    countryList = FileUtils().fetchListWithPreList<CountryModel>(
      listMap: countryCodes,
      parser: (json) {
        return CountryModel.fromJson(json);
      },
    );
    filteredList.value = countryList.then((list) => list);
  }

  Widget _searchFieldWidget() {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    TextEditingController searchController = TextEditingController();

    return TextFieldWidget(
      borderRadius: 30,
      controller: searchController,
      hintText: searchHint ?? 'Search Country...',
      hintStyle: searchHintTextStyle ??
          textTheme.bodySmall?.copyWith(color: colorScheme.inverseSurface),
      style: searchTextStyle ??
          textTheme.bodySmall?.copyWith(color: colorScheme.inverseSurface),
      backgroundColor: colorScheme.surface,
      borderColor: colorScheme.inverseSurface,
      unFocusColor: colorScheme.inverseSurface,
      focusColor: colorScheme.inverseSurface,
      prefixIcon: Icon(
        Icons.search_rounded,
        color: colorScheme.inverseSurface,
        size: 16.dp(),
      ),
      suffixIcon: InkWell(
        onTap: () {
          searchController.text = "";
          filteredList.value = countryList.then((list) => list);
        },
        child: Icon(
          Icons.cancel_rounded,
          color: colorScheme.inverseSurface,
          size: 16.dp(),
        ),
      ),
      onChanged: (query) async {
        await countryList.then((value) {
          filteredList.value = Future.value(RxList<CountryModel>.from(value
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()) ||
                  element.countryCode
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  element.phoneCode.toLowerCase().contains(query.toLowerCase()))
              .toList()));
        });
      },
    );
  }

  Widget _itemWidget(CountryModel item) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return TextButtonWidget(
      padding: EdgeInsets.all(5.dp()),
      onTap: () {
        navUtils.fireBack();
        item = item.copyWith(
          nameLocalized: CountryLocalizations.of(context)
              ?.countryName(countryCode: item.countryCode)
              ?.replaceAll(RegExp(r"\s+"), " "),
        );
        onCountrySelected?.call(item);
      },
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                // the conditional 50 prevents irregularities caused by the flags in RTL mode
                width: isRtl ? 50 : null,
                child: FutureBuilder(
                  future: FileUtils.countryCodeToEmoji(item.countryCode),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    String data = snapshot.hasData
                        ? snapshot.data!
                        : CountryModel.worldWide.countryCode;
                    return Text(
                      data == CountryModel.worldWide.countryCode
                          ? '\uD83C\uDF0D'
                          : data,
                      style: textTheme.bodyMedium,
                    );
                  },
                ),
              ),
              SizedBox(width: 10.dp()),
              SizedBox(
                width: 50,
                child: Text(
                  '${isRtl ? '' : '+'}${item.phoneCode}${isRtl ? '+' : ''}',
                  style: phoneCodeTextStyle ??
                      textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.inverseSurface),
                ),
              ),
              SizedBox(width: 10.dp()),
              Expanded(
                child: Text(
                  CountryLocalizations.of(context)
                          ?.countryName(countryCode: item.countryCode)
                          ?.replaceAll(RegExp(r"\s+"), " ") ??
                      item.name,
                  style: textStyle ??
                      textTheme.bodySmall
                          ?.copyWith(color: colorScheme.inverseSurface),
                ),
              ),
            ],
          ),
          SizedBox(height: appDimen.dimen(2)),
          DividerWidget(color: dividerColor ?? colorScheme.inverseSurface),
        ],
      ),
    );
  }
}
