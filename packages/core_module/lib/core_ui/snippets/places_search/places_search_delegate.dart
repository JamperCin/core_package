import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/model/remote/location_search_model.dart';
import 'package:core_module/core/services/location/location_api_service.dart';
import 'package:core_module/core_ui/base_screen/base_search_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';

class PlacesSearchDelegate extends BaseSearchStandard<LocationSearchModel> {
  RxBool isLoading = false.obs;
  RxBool isLoadingCurrentAddress = false.obs;
  final apiClient = LocationApiService();
  Rx<LocationSearchModel> selectedModel = LocationSearchModel().obs;
  final RxList<LocationSearchModel> list = RxList<LocationSearchModel>();

  PlacesSearchDelegate() {
    _initData();
  }

  Future<void> _initData() async {
    await Future.delayed(const Duration(milliseconds: 360));

    //Get the list of all selected locations
    List<LocationSearchModel> preList =
        appPreference.getListOfLocations().reversed.toList();

    list.value.addAll(preList.length > 5 ? preList.sublist(0, 5) : preList);

    selectedModel.value = await appPreference.getLocation();

    print("Selected ${selectedModel.value.address}");
  }

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Search location...";

  @override
  Future<List<LocationSearchModel>> fetchSuggestions({required String query}) {
    return apiClient.fetchSuggestions(query);
  }

  ///Location Item Widget when searching for location
  @override
  Widget listItemWidget(BuildContext context, LocationSearchModel item) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      tileColor: colorScheme.surface,
      title: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 0,
              child: Icon(
                Icons.location_pin,
                size: appDimen.dimen(6),
                color: Colors.black,
              ),
            ),
            SizedBox(width: appDimen.dimen(1)),
            Expanded(
              child: RichText(
                  maxLines: 4,
                  text: TextSpan(children: [
                    TextSpan(
                      text: item.address,
                      style: textTheme.labelMedium,
                    ),
                    TextSpan(
                      text: "\n",
                      style: textTheme.labelMedium,
                    ),
                    TextSpan(
                      text: item.description,
                      style: textTheme.labelSmall
                          ?.copyWith(fontSize: appDimen.dimen(2)),
                    )
                  ])),
            ),
            if (isLoading.value && (selectedModel.value == item))
              Align(
                alignment: Alignment.centerRight,
                child: LoaderWidget.withIndicator(
                  radius: appDimen.dimen(1),
                  color: colorScheme.inverseSurface,
                ),
              )
          ],
        ),
      ),
      onTap: () async {
        selectedModel.value = item;
        isLoading.value = true;
        selectedModel.value = await apiClient.getPlaceDetailFromId(item);
        isLoading.value = false;
        await _saveSelectedLocation(selectedModel.value);
        close(context, selectedModel.value);
      },
    );
  }

  @override
  void onClose(BuildContext context) {
    close(context, LocationSearchModel());
  }

  ///List of already added address or location history
  @override
  Widget suggestionsHistory(BuildContext context) {
    return Obx(
      () => ListView(
        children: [
          _currentLocation(context),
          ...list.map((e) => _specialLocationItem(e, context))
        ],
      ),
    );
  }

  ///Current location ui widget
  Widget _currentLocation(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () async {
        await _getCurrentLocation();
        if (selectedModel.value.latitude > 0.0) {
          await _saveSelectedLocation(selectedModel.value);
          close(context, selectedModel.value);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(appDimen.dimen(1)),
            child: Row(
              children: [
                // AssetImageWidget(
                //   height: appDimen.dimen(10),
                //   width: appDimen.dimen(10),
                //   asset: icNavigate,
                // ),
                Icon(Icons.navigation_outlined, size: appDimen.dimen(10)),
                SizedBox(width: appDimen.dimen(2)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current location', style: textTheme.labelMedium),
                      Text(
                        selectedModel.value.address,
                        style: textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                if (isLoadingCurrentAddress.value)
                  LoaderWidget.withIndicator(
                    radius: appDimen.dimen(1),
                    color: colorScheme.inverseSurface,
                  )
              ],
            ),
          ),
          DividerWidget(
            width: appDimen.screenWidth,
            height: 1,
            color: colorScheme.inverseSurface.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  ///Location item widget for the list of already selected address or location history.
  ///used in [_addressHistoryWidget]
  Widget _specialLocationItem(LocationSearchModel sug, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () async {
        await _saveSelectedLocation(sug);
        close(context, sug);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(appDimen.dimen(2)),
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  size: appDimen.dimen(10),
                  color: colorScheme.inverseSurface,
                ),
                SizedBox(width: appDimen.dimen(1)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sug.address, style: textTheme.labelMedium),
                      Text(sug.description, style: textTheme.labelSmall),
                    ],
                  ),
                ),
                if (selectedModel.value.address == sug.address)
                  SizedBox(width: appDimen.dimen(2)),
                if (selectedModel.value.address == sug.address)
                  Icon(
                    Icons.check_circle,
                    color: colorScheme.outline,
                    size: appDimen.dimen(10),
                  )
              ],
            ),
          ),
          DividerWidget(
            width: appDimen.screenWidth,
            height: 1,
            color: colorScheme.inverseSurface.withOpacity(0.2),
          ),
        ],
      ),
    );
  }

  //Retrieve the current location of user
  Future<void> _getCurrentLocation() async {
    isLoadingCurrentAddress.value = true;
    // currentLocation.value =
    // await ServiceInjectors().geolocationApi.getCurrentLocation();
    isLoadingCurrentAddress.value = false;
  }

  ///Save selected location to the DB
  Future<void> _saveSelectedLocation(LocationSearchModel place) async {
    if (place.latitude > 0.0) {
      ///check if place not already saved
      if (!list.contains(place) &&
          !list.any(
              (e) => e.address.toLowerCase() == place.address.toLowerCase())) {
        list.add(place);
        appPreference.saveListOfLocations(list);
      }
      appPreference.saveLocation(place);
    }
  }
}
