import 'package:core_module/core/model/local/country_model.dart';
import 'package:core_module/core_ui/snippets/country_picker/country_picker_delegate.dart';
import 'package:flutter/material.dart';

class CountryPicker {
  ///Pick a country from the country picker
  Future<void> showCountryPicker(
    BuildContext context, {
    required Function(CountryModel?) onSearch,
    TextStyle? textStyle,
    TextStyle? searchTextStyle,
    TextStyle? phoneCodeTextStyle,
    String? searchHint,
  }) async {
    showSearch(
      context: context,
      delegate: CountryPickerDelegate(
          textStyle: textStyle,
          searchHint: searchHint,
          searchTextStyle: searchTextStyle,
          phoneCodeTextStyle: phoneCodeTextStyle),
    ).then((location) {
      onSearch(location);
    });
  }
}
