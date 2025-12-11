import 'dart:io';

import 'package:core_module/core/utils/map_utils.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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
    String? secondaryKey,
    required String key,
    required dynamic Function(dynamic) parser,
  }) async {
    final results = await loadResources<List<T>>(
        path: path,
        parser: (json) {
          final objectWithList = (json[key] != null && json[key] is List)
              ? json[key] as List
              : null;
          if (objectWithList != null) {
            return [...objectWithList.map((e) => parser(e))];
          }

          if (secondaryKey != null &&
              json[key] != null &&
              json[key][secondaryKey] != null) {
            final inDepthObjectWithList = json[key][secondaryKey] is List
                ? json[key][secondaryKey] as List
                : null;
            return (inDepthObjectWithList != null)
                ? [...inDepthObjectWithList.map((e) => parser(e))]
                : [];
          }
          return [];
        });
    return results;
  }

  Future<List<T>> fetchListWithPreList<T>({
    required List<Map<String, dynamic>> listMap,
    required T Function(Map<String, dynamic>) parser,
  }) async {
    final results = listMap.map(parser).toList();
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


  // 0x41 is Letter A
  // 0x1F1E6 is Regional Indicator Symbol Letter A
  // Example :
  // firstLetter U => 20 + 0x1F1E6
  // secondLetter S => 18 + 0x1F1E6
  // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
  static Future<String> countryCodeToEmoji(String countryCode) async{
    try {
      final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
      final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
      return String.fromCharCode(firstLetter) +
          String.fromCharCode(secondLetter);
    }catch(e){
      return countryCode;
    }
  }


  ///1. Find the correct local path
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  ///2. Create a reference to the file location
  Future<File> _localFile(String fileName) async {
    final path = await _localPath;
    return File('$path/$fileName');
  }

  ///3. Write data to the file
  Future<File> writeData(String data, String fileName) async {
    final file = await _localFile(fileName);

    // Write the file
    return file.writeAsString(data);
  }

  ///4. Read data from the file
  Future<String> readData(String fileName) async {
    try {
      final file = await _localFile(fileName);

      // Read the file
      final contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return "";
    }
  }

   Future<String> downloadFile({String url = '', String? fileName}) async {
    if (url.isEmpty) {
      return "";
    }
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/${fileName ?? url.split('/').last}";
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

}
