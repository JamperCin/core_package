import 'dart:collection';
import 'package:flutter/material.dart';
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

  Future<void> saveListOfItems<T>({
    required List<T> list,
    required String key,
  }) async {
    HashMap<String, Object> map = HashMap();
    map.putIfAbsent("list", () => list);
    String place = MapUtils().convertEncode(map);
    setString(key, place);
  }

  List<T> getListOfItems<T>({
    required String key,
    required T Function(dynamic) parser,
  }) {
    List<T> list = [];
    try {
      list = MapUtils().stringToObject<List<T>>(
        getString(key),
            (json) {
          var j = json["list"] as List<dynamic>;
          return j.map<T>((p) => parser(p)).toList();
        },
      ) ??
          [];
    } catch (e) {
      return list;
    }

    return list;
  }

  void saveItem<T extends Object>(T item, String key) {
    String place = MapUtils().convertEncode(item);
    setString(key, place);
  }

  Future<T?> getItem<T>({required String key, required T Function(dynamic) parser}) async {
    try {
      return MapUtils().stringToObject(getString(key), (json) {
        return parser(json);
      });
    } catch (e) {
      debugPrint("Error $e");
    }
    return null;
  }

  void setToken(String token) {
    setString(TOKEN, token);
  }
}
