import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/model/remote/location_search_model.dart';
import 'package:core_module/core_ui/snippets/places_search/places_search_delegate.dart';

class PlacesPickerWidget extends StatelessWidget {

  final Function(LocationSearchModel) onSearch;
  final BuildContext? context;

  PlacesPickerWidget({super.key, required this.onSearch}): context = null;

  PlacesPickerWidget.searchPlaces({super.key, required this.onSearch, this.context}) {
    showSearch(
      context: context ?? Get.context!,
      delegate: PlacesSearchDelegate(),
    ).then((location) {
      onSearch(location!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
