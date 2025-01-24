import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:core_module/core/model/remote/location_search_model.dart';
import 'package:core_module/core/utils/map_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppDbPreference {
  static AppDbPreference? _instance;
  late SharedPreferences preference;
  final String TOKEN = "token";
  final String PREF_LOCATION = "PREF_LOCATION";
  final String PREF_LOCATION_LIST = "PREF_LOCATION_LIST";
  final String LOCATION_PERMISSION_ALLOWED = "LOCATION_PERMISSION_ALLOWED";

  AppDbPreference._();

  Future<void> initPreference() async {
    preference = await SharedPreferences.getInstance();
  }

  factory AppDbPreference() {
    return _instance ??= AppDbPreference._();
  }

  ///----------------- H E L P E R     M E T H O D S ------------------
  void setBool(String key, bool value) {
    preference.setBool(key, value);
  }

  void setString(String key, String value) {
    preference.setString(key, value);
  }

  bool getBool(String key) {
    return preference.getBool(key) ?? false;
  }

  String getString(String key) {
    return preference.getString(key) ?? "";
  }

  ///----------------- H E L P E R     M E T H O D S  E N D S ----------------

  String getToken() {
    return "Bearer ${getString(TOKEN)}";
  }

  Future<void> saveListOfLocations(List<LocationSearchModel> list) async {
    HashMap<String, Object> loc = HashMap();
    loc.putIfAbsent("list", () => list);
    String place = MapUtils().convertEncode(loc);
    setString(PREF_LOCATION_LIST, place);
  }

  List<LocationSearchModel> getListOfLocations() {
    List<LocationSearchModel> list = [];
    try {
      list = MapUtils().stringToObject<List<LocationSearchModel>>(
            getString(PREF_LOCATION_LIST),
            (json) {
              var j = json["list"] as List<dynamic>;
              return j
                  .map<LocationSearchModel>((p) =>
                      LocationSearchModel.fromJson(p as Map<String, dynamic>))
                  .toList();
            },
          ) ??
          [];
    } catch (e) {
      return list;
    }

    return list;
  }

  void saveLocation(LocationSearchModel sug) {
    String place = MapUtils().convertEncode(sug);
    setString(PREF_LOCATION, place);
  }

  Future<LocationSearchModel> getLocation() async {
    try {
      return MapUtils().stringToObject(getString(PREF_LOCATION), (json) {
            return LocationSearchModel.fromJson(json);
          }) ??
          LocationSearchModel();
    } catch (e) {
      debugPrint("Error $e");
    }
    return LocationSearchModel();
  }

  void setToken(String token) {
    setString(TOKEN, token);
  }
}
