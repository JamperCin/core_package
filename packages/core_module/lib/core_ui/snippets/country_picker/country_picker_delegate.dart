import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/country_model.dart';
import 'package:core_module/core_ui/base_screen/base_search_standard.dart';
import 'package:core_module/core_ui/snippets/country_picker/res/country_codes.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

import '../../../src/assets_path.dart';
import '../../../core/utils/file_utils.dart';
import '../../../core_module.dart';
import '../../widgets/text_button_widget.dart';
import 'country_localizations.dart';

class CountryPickerDelegate extends BaseSearchStandard<CountryModel> {
  late Future<List<CountryModel>> countryList;
  final TextStyle? textStyle;
  final TextStyle? phoneCodeTextStyle;
  final TextStyle? searchTextStyle;
  final String? searchHint;
  final Color? dividerColor;
  final BuildContext context;

  CountryPickerDelegate({
    required this.context,
    this.textStyle,
    this.searchTextStyle,
    this.searchHint,
    this.dividerColor,
    this.phoneCodeTextStyle,
  }) {
    _initData();
  }

  Future<void> _initData() async {
    countryList = FileUtils().fetchListWithPreList<CountryModel>(
      listMap: countryCodes,
      parser: (json) {
        return CountryModel.fromJson(json);
      },
    );
  }

  @override
  String? get searchFieldLabel => searchHint ?? "Search country...";

  @override
  TextStyle? get searchFieldStyle =>
      searchTextStyle ??
      Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.tertiary);

  @override
  double cardElevation() {
    return 0;
  }

  @override
  Future<List<CountryModel>> fetchSuggestions({required String query}) async {
    Future<List<CountryModel>> filterList = Future.value(<CountryModel>[]);
    await countryList.then((value) {
      filterList = Future.value(value
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) ||
              element.countryCode.toLowerCase().contains(query.toLowerCase()) ||
              element.phoneCode.toLowerCase().contains(query.toLowerCase()))
          .toList());
    });

    return filterList;
  }

  @override
  Widget listItemWidget(BuildContext context, CountryModel item) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return TextButtonWidget(
      padding: EdgeInsets.only(
        left: 2.dp(),
        right: 2.dp(),
      ),
      onTap: () {
        item = item.copyWith(
          nameLocalized: CountryLocalizations.of(context)
              ?.countryName(countryCode: item.countryCode)
              ?.replaceAll(RegExp(r"\s+"), " "),
        );
        close(context, item);
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
                  style: phoneCodeTextStyle ?? textTheme.bodyMedium,
                ),
              ),
              SizedBox(width: 10.dp()),
              Expanded(
                child: Text(
                  CountryLocalizations.of(context)
                          ?.countryName(countryCode: item.countryCode)
                          ?.replaceAll(RegExp(r"\s+"), " ") ??
                      item.name,
                  style: textStyle ?? textTheme.bodySmall,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.dp()),
          DividerWidget(color: dividerColor ?? colorScheme.surfaceDim),
        ],
      ),
    );
  }

  @override
  void onClose(BuildContext context) {
    close(context, const CountryModel());
  }

  @override
  Widget suggestionsHistory(BuildContext context) {
    return FutureBuilder(
      future: countryList,
      builder:
          (BuildContext context, AsyncSnapshot<List<CountryModel>> snapshot) {
        if (snapshot.hasData) {
          return listWidget(context, snapshot.data!);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
