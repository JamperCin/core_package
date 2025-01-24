import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/remote/location_search_model.dart';
import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/services/location/location_api_interface.dart';
import 'package:uuid/uuid.dart';

class LocationApiService extends BaseApiService
    implements LocationApiInterface {
  static LocationApiService? _instance;
  late BuildContext context;
  String sessionToken = '';

  LocationApiService._() {
    sessionToken = const Uuid().v4();
  }

  factory LocationApiService() {
    return _instance ??= LocationApiService._();
  }

  double _getLatLng(Map<String, dynamic> json, String key) {
    var geometry = getObject("geometry", json);
    if (geometry != null) {
      var location = geometry["location"];
      if (location != null) {
        return getObject(key, location);
      }
    }
    return 0.0;
  }

  @override
  Future<List<LocationSearchModel>> fetchSuggestions(String input) async {
    HashMap<String, dynamic> p = HashMap();
    p.putIfAbsent("input", () => input);
    p.putIfAbsent("components", () => "country:gh");
    p.putIfAbsent("key", () => config.getGoogleApiKey());
    p.putIfAbsent("sessiontoken", () => sessionToken);

    final map = await _instance?.getRequest(
      host: config.getGoogleEnvironment(),
      api: 'maps/api/place/autocomplete/json?',
      tokenHeader: false,
      param: p,
    );

    if (map != null && map.containsKey('status') &&
        map['status'] == 'OK' &&
        map.containsKey('predictions')) {
      return map['predictions']
          .map<LocationSearchModel>((p) => LocationSearchModel(
                placeId: p['place_id'],
                address: p['structured_formatting']['main_text'],
                description: p['description'],
              ))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<LocationSearchModel> getPlaceDetailFromId(
      LocationSearchModel model) async {
    HashMap<String, dynamic> p = HashMap();
    p.putIfAbsent("place_id", () => model.placeId);
    p.putIfAbsent("fields", () => "address_component");
    p.putIfAbsent("key", () => config.getGoogleApiKey());
    p.putIfAbsent("sessiontoken", () => sessionToken);

    final map = await _instance?.getRequest(
      host: config.getGoogleEnvironment(),
      tokenHeader: false,
      api: 'maps/api/geocode/json?',
      param: p,
    );

    final results = map['results'][0];
    return LocationSearchModel(
      address: model.description,
      longitude: _getLatLng(results, "lng"),
      latitude: _getLatLng(results, "lat"),
      description: getObject("formatted_address", results),
      placeId: model.placeId,
    );
  }
}
