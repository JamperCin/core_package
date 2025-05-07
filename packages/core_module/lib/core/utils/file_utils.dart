import 'package:core_module/core/utils/map_utils.dart';
import 'package:flutter/services.dart';

class FileUtils {
  static FileUtils? _fileUtils;

  FileUtils._();

  factory FileUtils() {
    return _fileUtils ??= FileUtils._();
  }

  Future<T> loadResources<T>({
    required String path,
    required T Function(dynamic) parser,
  }) async {
    try {
      String json = await rootBundle.loadString(path);
      dynamic response = MapUtils().convertDecode(json);
      T result = parser(response);
      return result;
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<List<T>> fetchList<T>({
    required String path,
    String? objectKey,
    required String key,
    required dynamic Function(dynamic) parser,
  }) async {
    final results = await loadResources<List<T>>(
        path: path,
        parser: (data) {
          final listMap = ((objectKey != null ? data[objectKey] : data ) as Map<String, dynamic>)[key] as List;
          return [...listMap.map((e) => parser(e))];
        });
    return results;
  }


  Future<List<Map<String, dynamic>>> fetchListOfMap({
    required String path,
    required String key,
    String? objectKey,
  }) async {
    final results = await loadResources<List<Map<String, dynamic>>>(
        path: path,
        parser: (data) {
          final listMap = ((objectKey != null ? data[objectKey] : data ) as Map<String, dynamic>)[key] as List;
          return [...listMap.map((e) => e as Map<String, dynamic>)];
        });
    return results;
  }

  Future<dynamic> fetchObject(String path, String key) async {
    final results = await loadResources<dynamic>(
        path: path,
        parser: (data) {
          return data[key];
        });
    return results;
  }

  static Future<String> countryCodeToEmoji(String countryCode) async{
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    try {
      final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
      final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
      return String.fromCharCode(firstLetter) +
          String.fromCharCode(secondLetter);
    }catch(e){
      return countryCode;
    }
  }
}
