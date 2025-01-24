import 'dart:math';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/remote/location_search_model.dart';

class GeoLocationHelper {
  static GeoLocationHelper? _instance;
  bool isLocationEnabled = false;
  bool isPermissionAccepted = false;
  final bool shouldAskPermission;

  GeoLocationHelper._(this.shouldAskPermission) {
    if(shouldAskPermission) {
      _checkPermissionStatus();
    }
  }

  factory GeoLocationHelper({bool askPermission = false}) {
    return _instance ??= GeoLocationHelper._(askPermission);
  }

  ///Check if Location services are Disabled or Enabled on the current user's device
  ///Return param : bool [TRUE / FALSE ]
  Future<bool> _isLocationEnabled() async {
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    return isLocationEnabled;
  }

  ///Check the permission status of the user
  ///Permissions can be in the state of [DENIED, DENIED-FOREVER , WHILE-IN-USE, ALWAYS, etc ]
  Future<void> _checkPermissionStatus() async {
    if (appDbPreference.getBool(appDbPreference.LOCATION_PERMISSION_ALLOWED)) {
      return;
    }

    var permission = await Geolocator.checkPermission();

    //if Permission is denied, ask user's permission again
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      appDbPreference.setBool(
          appDbPreference.LOCATION_PERMISSION_ALLOWED, true);
      return;
    }
  }

  Future<LocationSearchModel> getLastKnownLocation() async {
    Position? pos = await Geolocator.getLastKnownPosition();
    if (pos != null) {
      return await _buildLocation(pos.latitude, pos.longitude);
    }
    return  LocationSearchModel();
  }

  ///Get the current location position of the user
  ///Last known location
  Future<LocationSearchModel> getCurrentLocation() async {
    if (!(await _isLocationEnabled())) {
      return  LocationSearchModel();
    }

    Position pos = await Geolocator.getCurrentPosition();
    if (pos.latitude == 0.0) {
      return getLastKnownLocation();
    }
    return await _buildLocation(pos.latitude, pos.longitude);
  }

  ///Build a complete location Object which has both the coordinates and address
  ///This function takes [LatLng]
  /// A pair of latitude and longitude coordinates, stored as degrees.
  Future<LocationSearchModel> _buildLocation(double lat, double lng) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lng);
    Placemark add = placeMark.isNotEmpty ? placeMark.first : const Placemark();
    String address =
        "${_buildString(add.name)}${_buildString(add.subAdministrativeArea)}${_buildString(add.country, c: false)}";
    String desc =
        "${_buildString(add.street)}${_buildString(add.administrativeArea, c: false)}";

    return LocationSearchModel(
      latitude: lat,
      longitude: lng,
      address: address,
      description: desc,
    );
  }

  ///build the location Address with this method
  ///If should continue building pass the boolean [c]
  String _buildString(String? data, {bool c = true}) {
    if (data != null && data.isNotEmpty) {
      return "$data${c ? ", " : ""}";
    }
    return "";
  }

  double _calculateDistance(
    LocationSearchModel pointA,
    LocationSearchModel pointB,
  ) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((pointB.latitude - pointA.latitude) * p) / 2 +
        c(pointA.latitude * p) *
            c(pointB.latitude * p) *
            (1 - c((pointB.longitude - pointA.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  Future<String> getDistance(
    LocationSearchModel pointA,
    LocationSearchModel pointB, {
    int dec = 2,
  }) async {
    double distance = _calculateDistance(pointA, pointB);
    return "${distance.toStringAsFixed(dec)} Km";
  }
}
